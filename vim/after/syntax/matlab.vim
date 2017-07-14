if has('conceal')
	syn   keyword   conFunction   function   skipwhite   conceal   cchar=ƒ
	syn   keyword   conSum        end        skipwhite   conceal   cchar=¶
	"some functions
	syn   keyword   conSqrt   sqrt    skipwhite   conceal   cchar=√
	syn   keyword   conSum    sum     skipwhite   conceal   cchar=∑
	syn   keyword   conMean   mean    skipwhite   conceal   cchar=μ
	syn   keyword   conStd    std     skipwhite   conceal   cchar=σ
	syn   keyword   conStd    beta    skipwhite   conceal   cchar=β
	syn   keyword   conStd    gamma   skipwhite   conceal   cchar=γ
	syn   keyword   conStd    psi     skipwhite   conceal   cchar=ψ

	"constants
	syn   keyword   conPi    pi    skipwhite   conceal   cchar=π
	syn   keyword   conEps   eps   skipwhite   conceal   cchar=ε
	syn   keyword   conInf   Inf   skipwhite   conceal   cchar=∞

	"greek letters 
	if exists("g:beauty_matlab_greek") && g:beauty_matlab_greek
		syn   keyword   greekAlpha     alpha     conceal   cchar=α
		syn   keyword   greekDelta     delta     conceal   cchar=δ
		syn   keyword   greekEpsilon   epsilon   conceal   cchar=ε
		syn   keyword   greekZeta      zeta      conceal   cchar=ζ
		syn   keyword   greekEta       eta       conceal   cchar=η
		syn   keyword   greekTheta     theta     conceal   cchar=θ
		syn   keyword   greekIota      iota      conceal   cchar=ι
		syn   keyword   greekKappa     kappa     conceal   cchar=κ
		syn   keyword   greekLambda    lambda    conceal   cchar=λ
		syn   keyword   greekMu        mu        conceal   cchar=μ
		syn   keyword   greekNu        nu        conceal   cchar=ν
		syn   keyword   greekXi        xi        conceal   cchar=ξ
		syn   keyword   greekOmicron   omicron   conceal   cchar=ο
		syn   keyword   greekRho       rho       conceal   cchar=ρ
		syn   keyword   greekSigma     sigma     conceal   cchar=σ
		syn   keyword   greekTau       tau       conceal   cchar=τ
		syn   keyword   greekUpsilon   upsilon   conceal   cchar=υ
		syn   keyword   greekPhi       phi       conceal   cchar=φ
		syn   keyword   greekChi       chi       conceal   cchar=χ
		syn   keyword   greekOmega     omega     conceal   cchar=ω
	endif

	"comparisons
	syn   match   conNeq   "\~="   conceal   cchar=≠
	syn   match   conLeq   "<="    conceal   cchar=≤
	syn   match   conGe    ">="    conceal   cchar=≥
	"power of 2
	syn match conGe "\^2" conceal cchar=²
	
endif


