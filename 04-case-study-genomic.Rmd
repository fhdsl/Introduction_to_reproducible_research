# Case Study: Developing a Genomic Predictor


The case study presented here took place largely at Duke University and has at various times been referred to as the "Duke Saga". At a high level, it involved a research group that claimed to have developed a genomic signature that predicted whether a person would respond to cancer chemotherapy. When others tried to reproduce the predictive results of the genomic signature, they were unable to do so.

A brief time line is given below:

* In 2006, *Nature Medicine* published a paper by Anil Potti and colleagues titled "Genomic signature to guide the use of chemotherapeutics". The paper claimed to have developed a classifier based on applying microarray technology to cell lines maintained by the National Cancer Institute (NCI). They claimed the classifier could determine which patients would respond to chemotherapy treatment.

* Keith Baggerly and Kevin Coombes, two biostatisticians at the MD Anderson Cancer Center were inundated by requests from (justifiably) excited colleagues who wanted to use this technology. Baggerly and Coombes attempted to reproduce the results using the published description but were unable to do so. They *were* able to reproduce certain results in the paper after deliberately introducing a series of errors into the data analysis.

* Since this initial incident, a number of other papers from the same lab were scrutinized and numerous errors in analyses were found, many that one might consider basic data handling and wrangling mistakes. In addition, Baggerly and Coombes found circumstantial evidence of deliberate fraud, such as claiming that certain genes were critical to a classifier even though those genes are not included in the microarray claimed to have been used.

* Clinical trials were started at Duke where patients were randomized into different arms of the trial based on the flawed techniques developed by Potti. After numerous scientists wrote a letter to NCI director Harold Varmus, Duke suspended the trials to investigate the situation. An internal Duke panel eventually cleared Potti and colleagues of any wrongdoing and restarted the trials. Time passes and eventually it is discovered by the *The Cancer Letter* that Potti lied on an application for federal funding about once being a Rhodes Scholar. Eventually, the trials were stopped, but only after much public scrutiny and a series of lawsuits. 

There is quite a bit more detail to this story, which played out over many years. If you want to hear more about this you can hear about it from [Keith Baggerly himself](https://youtu.be/7gYIs7uYbMo) in this nice lecture. 

This saga has been a difficult one to understand from the perspective of drawing generalizable lessons. While it’s fascinating because of the sheer number of problems that occurred, it's not necessarily clear what intervention could be taken to prevent a similar episode from happening in the future. Problems with reproducibility clearly played a role here given that Baggerly and Coombes were initially unable to reproduce any of the original analyses. 


## Initial Lessons


While the details of the Duke Saga were at time astonishing, it is difficult to draw any conclusion about what actually went wrong and what approach should be taken to prevent something like this from happening again. Most people on the outside were just speculating about what could have happened and the people who really would know the details weren’t talking very much. Here’s what most people seemed to take away from the publicly available information about the saga:

* **Reproducibility**. There was definitely a reproducible research angle to this saga, in that the analyses that were conducted lacked transparency. There was only sketchy code that was published along with paper and data were not immediately available. However, in a strange sense, much of what came to light did so because the work was ultimately partially reproducible. That is in fact how Baggerly and Coombes discovered all the problems. They were able to reproduce the findings *after* deliberately introducing mistakes in the data. If one went back in time and magically forced everyone in the lab to use R Markdown or Juypter Notebooks, it’s not clear how that would have prevented anything. For starters, everyone within the team had access to the analyses and the data. It’s possible that people outside the team might have discovered problems sooner if the work had been completely reproducible, but Baggerly and Coombes figured things out relatively quickly. Also, that is besides the point: We should not depend on people outside the research team as a primary defense against data analytic failure. It's not clear that reproducibility is one of the lessons learned from this saga because it's not clear that it would have made a difference.

* **Expertise**. The basic narrative explaining this saga was that the data analyses were poorly done. Statisticians in particular have focused on the use of proprietary software, non-reproducible workflows (like pointing and clicking in Excel), and incorrect application of otherwise sound statistical methodology (e.g. cross validation). Perhaps if better-trained people had been doing the analyses, none of this would have happened. Perhaps genomic analyses are too complicated for the traditionally trained laboratory scientist. The idea is that this kind of work is "hard to do" and that you need better people (or improve existing people). That is the gist of the summary in [this segment from the television show 60 Minutes](https://youtu.be/66dPIFMJ_-A) on the entire saga.

* **Individual behavior**. Anil Potti, the principal investigator of the study, was eventually fired from Duke over this scandal and most would agree with that decision. If Duke had fired him 10 years ago, then perhaps yes, this research would not have happened at Duke, but it might have happened somewhere else, or it might have happened at Duke but with a different principal investigator. So while Dr. Potti was ultimately responsible for the analyses, his firing does not provide a useful "lesson learned". 

## New Information Appears

In January 2015, *The Cancer Letter* [published a blockbuster memo](https://cancerletter.com/articles/20150109_1/) written by Bradford Perez, who in 2008 was a medical student trainee in the Potti lab. He saw what was going on in the lab and recognized its shoddiness. Problems that Baggerly and Coombes had to essentially reverse engineer, Perez saw first hand and immediately recognized them as serious. In fact, in 2008 he wrote a memo to the leadership of his institute describing some of those problems:

> “Fifty-nine cell line samples with mRNA expression data…were split in half to designate sensitive and resistant phenotypes. Then in developing the model, *only those samples which fit the model best in cross validation were included*. Over half of the original samples were removed…. This was an incredibly biased approach which does little more than give the appearance of a successful cross validation.” [emphasis added] 

He further wrote,

> At this point, I believe that the situation is serious enough that all further analysis should be stopped to evaluate what is known about each predictor and it should be reconsidered which are appropriate to continue using and under what circumstances…. I would argue that at this point nothing…should be taken for granted. All claims of predictor validations should be independently and blindly performed.”

The memo was ignored by Institute leadership. Nothing was stopped and nothing was changed at the time. Perez eventually took his name off a series of papers and left the lab.


## Lessons Learned

The Perez memo is critical because it fundamentally changes the narrative about what went wrong in this entire saga. Yes, genomic analyses are "hard to do" but clearly there was expertise in the lab to recognize that difficulty and to recognize when statistical methods were being incorrectly applied. The problem was not a lack of training, nor was it simply the result of a few honest data management mistakes here and there. The problem was a breakdown in communication and a total lack of trust between investigators and members of the data analytic team. Perez clearly felt uncomfortable raising these issues in the lab and wrote the memo knowing that he had "much to lose". He thought the problem in the lab was that statistical methods were being misapplied, but the real problem in the lab was that *he did not feel comfortable discussing it*. A breakdown in the relationship between an analyst and an investigator is a serious *data analytic problem*.

It’s possible to imagine an alternate scenario where a data analyst like Perez sees a problem with the way models are being developed or applied, mentions this to the principal investigator and has a detailed discussion, perhaps seeks outside expertise (e.g. from a statistician), and then modifies the procedure to fix the problem. This is a process that happens pretty much every day in many labs around the world. No data analysis is perfect from start to finish. Changes and course corrections are constantly made along the way. problems that can be traced to data collection can be raised with the principal investigator. When results are given to other investigators, sometimes the results don’t seem right to them and they will seek clarification. Mistakes can be fixed and results can be updated. 

When the relationships between an analyst and various members of the investigator team are strong and there is substantial trust between them, honest mistakes are just minor bumps in the road that can be uncovered, discussed, and fixed. When there is a breakdown in those relationships, the exact same mistakes are covered up, denied, and buried. A breakdown in the relationships between analysts and other investigators on the team generally cannot be fixed with a better statistical method, or a reproducible workflow, or open source software. Recognizing that this is the problem is difficult because often there is no easy solution. 

## Summary 

The data analytic lesson learned from the Duke Saga is that data analysts need to be allowed to say "stop". But also, the ability to do so depends critically on the relationships between the analyst and members of the investigator team. If an analyst feels uncomfortable raising analytic issues with other members, then arguably all analyses done by the team are at risk. No amount of statistical expertise or tooling can fix this fundamental human problem.
