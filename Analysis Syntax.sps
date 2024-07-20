* Encoding: UTF-8.
*Predictors of Coping with Expectation Violations in the Communication About Death and Dying
    
*Cronbach's Alpha DAP-GR

*DAP-GR subscale: Fear of death
    
RELIABILITY
  /VARIABLES=dap_01 dap_02 dap_04 dap_07 dap_09 dap_10 dap_12
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

*DAP-GR subscale: Death avoidance
    
RELIABILITY
  /VARIABLES=dap_03 dap_05 dap_06 dap_08 dap_11
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.



*EXPERIMENT 1
    
*Validity of the vignettes
    
DATASET ACTIVATE DataSet1.
DESCRIPTIVES VARIABLES=valid_cr
  /STATISTICS=MEAN STDDEV MIN MAX.

*Differences in validity between groups (Credibility low vs. neutral vs. high)

ONEWAY valid_cr BY gr_cred
  /STATISTICS DESCRIPTIVES
  /PLOT MEANS
  /MISSING ANALYSIS
  /CRITERIA=CILEVEL(0.95).

*One-way ANOVA: Credibility on immunization
    
DATASET ACTIVATE DataSet1.
ONEWAY cred_imm BY gr_cred
  /ES=OVERALL
  /STATISTICS DESCRIPTIVES
  /PLOT MEANS
  /MISSING ANALYSIS
  /CRITERIA=CILEVEL(0.95).

*One-way ANOVA: Credibility on accommodation
    
DATASET ACTIVATE DataSet1.
ONEWAY cred_acc BY gr_cred
  /ES=OVERALL
  /STATISTICS DESCRIPTIVES
  /PLOT MEANS
  /MISSING ANALYSIS
  /CRITERIA=CILEVEL(0.95).



*EXPERIMENT 2
    
*Validity of the vignettes

DATASET ACTIVATE DataSet1.
DESCRIPTIVES VARIABLES=valid_va
  /STATISTICS=MEAN STDDEV MIN MAX.

*Differences in validity between groups (Valence better-than-expected vs. worse-than-expected)

ONEWAY valid_va BY gr_val
  /STATISTICS DESCRIPTIVES
  /PLOT MEANS
  /MISSING ANALYSIS
  /CRITERIA=CILEVEL(0.95).

*Two-way ANOVA: Valence x fear of death on immunization
    
UNIANOVA val_imm BY gr_val fd_split
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(gr_val*fd_split) TYPE=BAR ERRORBAR=NO MEANREFERENCE=NO
  /PRINT ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gr_val fd_split gr_val*fd_split.

*Two-way ANOVA: Valence x fear of death on accommodation
    
UNIANOVA val_acc BY gr_val fd_split
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(gr_val*fd_split) TYPE=BAR ERRORBAR=NO MEANREFERENCE=NO
  /PRINT ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gr_val fd_split gr_val*fd_split.

*Two-way ANOVA: Valence x death avoidance on immunization
    
UNIANOVA val_imm BY gr_val da_split
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(gr_val*da_split) TYPE=BAR ERRORBAR=NO MEANREFERENCE=NO
  /PRINT ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gr_val da_split gr_val*da_split.

*Two-way ANOVA: Valence x death avoidance on accommodation
    
UNIANOVA val_acc BY gr_val da_split
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(gr_val*da_split) TYPE=BAR ERRORBAR=NO MEANREFERENCE=NO
  /PRINT ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gr_val da_split gr_val*da_split.
