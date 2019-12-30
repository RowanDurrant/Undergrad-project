# Undergrad-project

Code from my final year project on prion diseases. This model takes into account both horizontal and vertical transmission, with infection rates varying depending on the host PRNP genotype.

The PRNP genotype frequencies of some breeds of sheep are included in the code. Here are the breeds and the references for where the genotype frequencies came from: <br/>

Black Headed Sheep	-	Wiśniewska et al., 2011 <br/>
Black-Faced Latxa	-	Garcia-Crespo et al., 2004 <br/>
Chios	-	Billinis et al., 2004 <br/>
Djallonké	-	Traoré et al., 2012 <br/>
Finnish Landrace	-	Hautaniemi, 2012 <br/>
Hu	-	Guan et al., 2011 <br/>
Ivesi	-	Frootan et al., 2012 <br/>
Kamieniecka	-	Szkudlarek-Kowalczyk et al., 2010 <br/>
Kıvırcık	-	Meydan et al., 2012 <br/>
Leccesse	-	Martemucci et al., 2015 <br/>
Skopelos	-	Ekateriniadou et al., 2007 <br/>
Synthetic Population Bulgarian Milky Sheep	-	Sirakov et al., 2011 <br/>
Texel	-	Dobly et al., 2013 <br/>

Additional breeds can be added using the decimal genotype frequency, with the genotypes in this order: <br/>
arr/arr, arr/arq, arr/arh, arr/ahq, arq/arq, arq/ahq, arq/arh, ahq/ahq, ahq/arh, arh/arh, arr/vrq, arq/vrq, ahq/vrq, arh/vrq, vrq/vrq. <br/>
Rarer genotypes were excluded because I couldn't find any relative infection risk literature at the time, but I may add these in the future. <br/>
Relative infection risk was based on the results of Baylis et al., 2004.


<u> References: </u> <br/>

- Baylis, M., Chihota, C., Stevenson, E., Goldmann, W., Smith, A., Sivam, K., Tongue, S., Gravenor, M.B. Risk of scrapie in British sheep of different prion protein genotype. Journal of Generak Virology (2004) 85:2735-2740. 10.1099/vir.0.79876-0. <br/>
- Billinis, C., Psychas, V., Leontides, L., Spyrou, V., Argyroudis, S., Vlemmas, I., et al. Prion protein gene polymorphisms in healthy and scrapie-affected sheep in Greece. Journal of General Virology (2004) 85:547 – 554. <br/>
- Dobly, A., Van der Heyden, S., and Roels, S. Trends in genotype frequency resulting from breeding for resistance to classical scrapie in Belgium (2006~2011). J Vet Sci (2013) 14(1):45 – 51.<br/>
- Ekateriniadou, L.V., Panagiotidis, C.H., Terzis, A., Ploumi, K., Triantafyllidis, A., Deligiannidis, P., et al. Genotyping for PrP gene polymorphisms in rare Greek breeds of sheep Veterinary Record (2007) 160:194 – 195. <br/>
- Frootan, F., Nikbakht, G., Özgentürk, N.Ö., and Ün, C. Prion Protein Coding Gene (PRNP) Variability in Sheep from Turkey and Iran. Biochem Genet (2012) 50(3-4): 277 – 284. <br/>
- Garcia-Crespo, D., Oporto, B., Gomez, N., Nagore, D., Benedicto, L., Juste, R.A., et al. PrP polymorphisms in Basque sheep breeds determined by PCR-restriction fragment length polymorphism and real-time PCR. Veterinary Record (2004) 154:717 – 722. <br/>
- Guan, F., Pan, L., Li, J., Tang, H., Zhu, C., and Shi, G. Polymorphisms of the prion protein gene and their effects on litter size and risk evaluation for scrapie in Chinese Hu sheep. Virus Genes (2011) 43(1):147 – 152. <br/>
- Hautaniemi, M., Tapiovaara, H., Korpenfelt, S-L., and Sihvonen, L. Genotyping and surveillance for scrapie in Finnish sheep. BMC Veterinary Research (2012) 8(122). DOI: 10.1186/1746-6148-8-122. <br/>
- Martemucci, G., Iamartino, D., Blasi, M., and D'Alessandro, A.G. PrP genotype frequencies and risk evaluation for scrapie in dairy sheep breeds from southern Italy. Preventive Veterinary Medicine (2015) 122(3):318 – 324.<br/>
- Meydan, H., Yüceer, B., Degirmenci, R., Özkan, M. M., and Yildiz, M. A. Prion protein gene polymorphism and genetic risk evaluation for scrapie in all Turkish native sheep breeds. Virus Genes (2012) 45(1):169 – 175. <br/>
- Sirakov, I., Peshev, R. and Christova, L. Genetic predisposition of some Bulgarian sheep breeds to the scrapie disease. Virus Genes (2011) 43(1): 153 - 159. <br/>
- Szkudlarek-Kowalczyk, M., Wiśniewska, E., Milewski, S., and Mroczkowski, S. Prion protein gene (PRNP) polymorphism in a flock of sheep of Kamieniecka breed. Bull Vet Inst Pulawy (2010) 54:645 – 649. <br/>
- Traoré, A., Royo, L.J., Kaboré, A., Pérez-Pardal, L., Álvarez, I., Fernández, I., et al. Prion protein gene polymorphism in four West African sheep populations. Trop Anim Health Prod (2012) 44(7):1469 – 1472. <br/>
- Wiśniewska, E., Mroczkowski, S., and Szkudlarek-Kowalczyk, M. Prion protein gene polymorphisms and breeding for scrapie resistance in the Black-Headed sheep. Bull Vet Inst Pulawy (2011) 55:781 – 785.
