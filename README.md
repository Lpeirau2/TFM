# Master's thesis
This repository is about my master's thesis: _"Acquisition and analysis of data from futsal matches"_.

It has been developed with data provided by an amateur futsal team that plays in the top division of Catalonia. 

Moreover, it has to be understood as a **full data science project** that gives amateur futsal teams a method on how to analyse the performance of the players. 

In fact, the **three aims** are:

1. Digitalize existing data and propose new ways of recording match information to facilitate automatic extraction in the future. 
2. Structure the data for its maintenance, management, and analysis.
3. Use the data to better understand the matches, investigate the performance of each player, improve collective and group performance and facilitate the preparation of the following training sessions.

In order to ease the development, the results have been divided into two groups:non-visual and visual results. 

1. **Non-visuals results (first and second aims):**
* **NV1:** improvement on how to collect data.
* **NV2:** creation of a pipeline to digitalize and store the data with taking only one photo.

2. **Visual results (third aim):**
* **V1:** Dashboard with Looker (V1)
* **V2:** Principal Component Analysis (PCA) to analyse the performances of the players (V2)
* **V3:** Gaussian Mixtures (GM) to estimate de density function and to cluster the players according to their performances (Unsupervised Machine Learning)

In here, it can be found a folder per result containing all the necessary to be able to reproduce what has been done. There only appear those results that can be generalized. 

Finally, **the conlusions** for this master's thesis are:
* There has been a design of a relational database from scratch.
* The data is stored on the cloud and it allows new information to be appended. 
* It can be understood by a wide range of publics. 
* V2 and V3 have to be considered as a first approach. 

And for those who want the carry on with this investigation it is suggested to:
* To cluster the players with a hierarchical component.
* To treat the data as compositional data.








