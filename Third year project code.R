# libs ------------------------------------------------------

# genotype frequencies ------------------------------------------------------
	##the PrP genotypes are noted as below:
	##1. arr/arr 2. arr/arq 3. arr/arh 4. arr/ahq 5. arq/arq
	##6. arq/ahq 7. arq/arh 8. ahq/ahq 9. ahq/arh 10. arh/arh
	##11. arr/vrq 12. arq/vrq 13. ahq/vrq 14. arh/vrq 15. vrq/vrq

	#breed genotype frequencies: ARR/ARR=0.066, ARR/ARQ = 0.066 etc...
	Equal = c(0.066,0.066,0.066,0.066,0.066,0.066,0.066,0.066,0.066,0.066,0.066,0.066,0.066,0.066,0.066)
	Hu = c(0.022,0.391,0.029,0,0.348,0.015,0.159,0,0,0.029,0,0.007,0,0,0)
	Chios = c(0,0.162,0,0,0.667,0.172,0,0,0,0,0,0,0,0,0)
	Texel = c(0.541,0.193,0.169,0.012,0.02,0.006,0.026,0.001,0.007,0.009,0.01,0.004,0,0.004,0)
	Latxa = c(0.051,0.336,0.006,0.004,0.517,0.01,0.038,0,0.002,0,0.008,0.023,0,0.004,0.002)
	Leccesse = c(0.119,0.371,0.004,0.033,0.365,0.072,0.016,0.016,0,0,0.004,0,0,0,0)
	Finsheep = c(0.013,0.161,0.004,0,0.70,0.004,0.008,0,0,0,0,0.104,0,0,0.004)
	BHS = c(0.653,0,0,0,0.347,0,0,0,0,0,0,0,0,0,0)
	Kamieniecka = c(0.353,0.333,0.157,0,0.029,0,0.01,0,0,0.01,0.069,0.029,0,0.01,0)
	Skopelos = c(0.105,0.158,0,0.158,0.053,0.2105,0,0.2105,0,0,0,0,0.105,0,0)
	Kivircik = c(0.093,0.407,0,0.029,0.329,0.093,0,0.014,0,0,0.007,0.014,0.007,0,0.007)
	Djallonke = c(0,0,0,0,0.86,0.12,0,0.02,0,0,0,0,0,0,0)
	Ivesi = c(0,0.063,0,0,0.563,0,0.281,0,0,0,0.031,0,0,0,0)
	SPBM = c(0.102,0.225,0.041,0.020,0.265,0.163,0.061,0.041,0.02,0,0.041,0.02,0,0,0)


# simulation ------------------------------------------------------

scrapiesim = function(breed, hrate, vrate, grate, arate, drate, time, pop){


	#starting values at t=0
	S = rpois(15, pop*breed) #starting susceptibles of each genotype
	for(m in 1:length(breed)){
		if(is.na(S[m]) == TRUE){S[m] = 0}
		}

	Ih = c(0,0,0,0,1,0,0,0,0,0,0,0,0,0,0) #initially infected. If Ih[1]=1, then there is 1 individual of that genotype infected etc
	Iv = c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0) #vertically infected
	R = c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0) #death count
	
	#set up vectors for plotting later
	timelim = time #observations over n years
	Io = c(sum(Ih))
	dead = c(sum(R))
	susc = c(sum(S))

	rel.inf = c(0,0.0007,0,0.00055,0.068,0.016,0.01,0.0092,0,0.0037,0.012,0.41,0.0013,0.74,1) #infection relative risk
	b = rel.inf*hrate #relative horizontal infection risk
	v = rel.inf*vrate #relative vertical infection risk
	g = grate #prion death rate
	a = arate #birth rate
	d = drate #natural causes death rate

	for(j in 1:timelim){
		totalinf = sum(Ih) + sum(Iv)
		nS = c()
		nIv = c()
		tg = c()
		for(k in 1:15){
			nb = c()
			nb[k] = rpois(1, b[k]*S[k]*totalinf) #new infecteds for this year
			if(is.na(nb[k]) == TRUE){nb[k] = 0}
			Sd = rpois(1, d*S[k]) #number of susceptibles that died by natural causes
			if(is.na(Sd) == TRUE){Sd = 0}
			Ihd = rpois(1, d*Ih[k]) #Ih killed by natural causes
			if(is.na(Ihd) == TRUE){Ihd = 0}
			Ivd = rpois(1, d*Iv[k]) #Iv killed by natural causes
			if(is.na(Ivd) == TRUE){Ivd = 0}
			Ihg = rpois(1, g*Ih[k]) #Ih killed by scrapie
			if(is.na(Ihg) == TRUE){Ihg = 0}
			Ivg = rpois(1, g*Iv[k]) #Iv killed by scrapie
			if(is.na(Ivg) == TRUE){Ivg = 0}
			nS[k] = newS(S[k], nb[k], Sd) #removes infected susceptibles
			Ih[k] = newIh(S[k], Ih[k], nb[k], Ihg, Ihd) #updates no. infected vertically
			nIv[k] = newIv(Iv[k], Ivg, Ivd) #removes dead infected vertically
			R[k] = newR(R[k], Ivg, Ihg) #calculates death count
			tg[k] = nS[k] + Ih[k] + nIv[k] #totals each genotype
		}
			

		totalsus = sum(nS) #sum of all susceptibles
		totalinf = sum(nIv) + sum(Ih) #sum of all infecteds
		alleles = 2*(sum(tg)) #sum of all alleles
		
		#total number of each allele
		ARR = 2*tg[1] + tg[2] + tg[3] + tg[4] + tg[11] 
		ARQ = tg[5]*2 + tg[2] + tg[6] + tg[7] + tg[12]
		ARH = tg[10]*2 + tg[3] + tg[7] + tg[9] + tg[14]
		AHQ = tg[8]*2 + tg[4] + tg[6] + tg[9] + tg[13]
		VRQ = tg[15]*2 + tg[11] + tg[12] + tg[13] + tg[14]

		#contains genotype frequencies
		gen = c(hombirths(ARR,alleles),hetbirths(ARR, alleles, ARQ),hetbirths(ARR, alleles, ARH),hetbirths(ARR, alleles, AHQ),hombirths(ARQ, alleles),hetbirths(ARQ, alleles, AHQ),hetbirths(ARQ, alleles, ARH),hombirths(AHQ, alleles),hetbirths(AHQ, alleles, ARH),hombirths(ARH, alleles),hetbirths(ARR, alleles, VRQ),hetbirths(ARQ, alleles, VRQ),hetbirths(AHQ, alleles, VRQ),hetbirths(ARH, alleles, VRQ),hombirths(VRQ, alleles))
		
		for(l in 1:15){
			Sa = rpois(1, gen[l]*a*totalsus) #healthy births for each genotype
			if(is.na(Sa) == TRUE){Sa = 0}
			Iva = rpois(1, a*v[l]*totalinf*gen[l]) #vertically infected births
			if(is.na(Iva) == TRUE){Iva = 0}
			SIa = rpois(1, a*totalinf*gen[l]) #total sheep that could be born susceptible, if none are born infected
			if(is.na(SIa) == TRUE){SIa = 0}
			S[l] = nS[l] + Sa + (SIa-Iva)
			if(SIa-Iva <0){S[l] = nS[l] + Sa}
			Iv[l] = nIv[l] + Iva
		}

		Io[j+1] = sum(Ih) + sum(Iv)
		dead[j+1] = sum(R)
		susc[j+1] = sum(S)
		}

	#making the matrix
	data = cbind(susc, Io, dead)
	years = c(0:timelim)
	data = cbind(years, data)
	print(data)

  plot(susc ~ years, xlab = "Time", ylab = "No. Healthy", ylim = c(0,pop+100))
  lines(years, susc)
  points(Io ~ years, xlab = "Time", ylab = "No. Infected", col = "red")
   lines(years, Io, col = "red") 
	}

#calculates new susceptibles -----------------------------------------------------

newS = function(S, nb, Sd){ 
	Sn = S - nb - Sd
	if(Sn < 0){Sn=0}
	return(Sn)
	}

#calculates new horizontally infected ------------------------------------------

newIh = function(S, Ih, nb, Ihg, Ihd){
	Ihn = Ih + nb - Ihg - Ihd
if(nb > S){Ihn = Ih + S - Ihg - Ihd} #stops more sheep being infected than actually exist
	if(Ihn <0){Ihn=0}
	return(Ihn)
	}

#calculates new vertically infected ---------------------------------------------

newIv = function(Iv, Ivg, Ivd){
	Ivn = Iv - Ivg - Ivd
	if(Ivn<0){Ivn=0}
	return(Ivn)
	}

#calculates total deaths -----------------------------------------------------

newR = function(R, Ivg, Ihg){
	Rn = R + Ivg + Ihg #changed to prion only deaths
	return(Rn)
	}

#calculates genotype frequencies for homozygous genotypes ---------------------

hombirths = function(allele1, alleles){
	genfreq = (allele1/alleles)^2
	return(genfreq)
	}

#calculates genotype frequencies for heterozygous genotypes --------------------

hetbirths = function(allele1, alleles, allele2){
	genfreq = 2*(allele1/alleles)*(allele2/alleles)
	return(genfreq)
	}

#variables & RUN SIM ----------------------------------------------------------------------

	hrate = 0.14 #horizontal transmission rate
	vrate = 0.25 #vertical transmission rate
	grate = 0.5  #scrapie death rate
	arate = 0.25 #birth rate
	drate = 0.2  #non-scrapie death rate
	time = 75    #simulation time scale
	pop = 1000   #starting healthy population size

scrapiesim(Kivircik, hrate, vrate, grate, arate, drate, time, pop)
