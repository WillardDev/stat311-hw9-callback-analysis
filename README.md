# Logistic Regression Analysis: Multiple Dataset Studies

## Overview

This repository contains comprehensive logistic regression analyses of three different datasets, demonstrating various applications of binary classification modeling. Each analysis follows a structured approach from exploratory data analysis through model selection to interpretation and conclusions.

## Repository Structure

```
logistic-regression-analysis/
├── README.md
├── analyses/
│   ├── callback-analysis/
│   │   ├── Callback-Analysis-Final.Rmd
│   │   ├── callbackData.csv
│   │   └── callback-analysis-output.html
│   ├── loan-default-analysis/
│   │   ├── Loan-Default-Analysis-Final.Rmd
│   │   ├── LoanDefaultData.csv
│   │   └── loan-default-output.html
│   └── berkeley-admissions/
│       ├── STAT311-HW9.R
│       ├── BerkeleyData.csv
│       └── berkeley-analysis-notes.md
├── templates/
│   └── FinalTemplate.Rmd
└── docs/
    ├── methodology.md
    └── interpretation-guide.md
```

## Dataset Analyses

### 1. Job Application Callback Study
**File**: `analyses/callback-analysis/Callback-Analysis-Final.Rmd`
**Data**: Employment discrimination study with 4,870 job applications

**Research Question**: What factors influence employer callbacks for job applications?

**Key Variables**:
- **Response**: Callback received (binary)
- **Predictors**: Race, gender, education, experience, city, skills, etc.

**Key Findings**:
- Significant racial bias: White applicants have 55.6% higher odds of callbacks
- Education and honors strongly predict positive outcomes
- Gender effects show females receive more callbacks in this dataset
- Computer skills and complete contact information improve chances

**Statistical Significance**: Strong evidence of discrimination in hiring practices

### 2. Loan Default Prediction
**File**: `analyses/loan-default-analysis/Loan-Default-Analysis-Final.Rmd`
**Data**: Financial dataset with 3,500 loan applications

**Research Question**: What borrower characteristics predict loan defaults?

**Key Variables**:
- **Response**: Loan default (binary)
- **Predictors**: Income, credit score, interest rate, employment, education, co-signer

**Key Findings**:
- Income is the strongest protective factor (86.6% odds reduction per $100k)
- Co-signers dramatically reduce default risk (71.2% odds reduction)
- Higher interest rates increase default likelihood
- Unexpected finding: Master's degree holders show higher default rates
- Full-time employment provides significant protection

**Business Impact**: Critical for credit risk assessment and loan pricing

### 3. Berkeley Admissions Analysis
**File**: `analyses/berkeley-admissions/STAT311-HW9.R`
**Data**: Classic Simpson's Paradox demonstration with 4,526 admission records

**Research Question**: Is there gender bias in university admissions?

**Key Variables**:
- **Response**: Admission decision (binary)
- **Predictors**: Gender, department

**Key Findings**:
- Demonstrates Simpson's Paradox in action
- Marginal analysis may show apparent gender bias
- Department-specific analysis reveals complex interaction patterns
- Different departments show varying selection effects

**Educational Value**: Perfect example of confounding variables and interaction effects

## Methodology

All analyses follow a consistent four-part structure:

### 1. Introduction (8 points)
- Dataset description and research context
- Variable identification and classification
- Expected relationships and hypotheses

### 2. Model Fitting (12 points)
- Exploratory data analysis
- Progressive model building
- Stepwise selection procedures
- Model comparison using AIC

### 3. Model Summary (8 points)
- Final model equation presentation
- Coefficient interpretation
- Odds ratio calculations
- Baseline case identification

### 4. Conclusion (8 points)
- Key findings synthesis
- Practical implications
- Unexpected results discussion
- Recommendations for action

## Statistical Techniques Demonstrated

### Core Logistic Regression Concepts
- **Binary outcome modeling** using logit link function
- **Odds and odds ratios** interpretation
- **Log-odds vs probability** conversions
- **Statistical significance** testing with p-values

### Model Selection Methods
- **Forward stepwise selection** building from null model
- **Backward elimination** from full model
- **AIC-based comparison** for optimal model selection
- **Coefficient significance** evaluation

### Advanced Interpretations
- **Interaction effects** in complex models
- **Confounding variable** identification
- **Simpson's Paradox** demonstration
- **Practical vs statistical significance** distinction

## Key Learning Outcomes

### Technical Skills
1. **R Programming**: GLM fitting, data manipulation, statistical testing
2. **Model Selection**: Systematic variable selection procedures
3. **Interpretation**: Converting coefficients to meaningful business insights
4. **Validation**: Model comparison and goodness-of-fit assessment

### Statistical Reasoning
1. **Bias Detection**: Identifying discrimination and unfair practices
2. **Causality vs Correlation**: Understanding confounding effects
3. **Risk Assessment**: Quantifying probability and uncertainty
4. **Decision Making**: Translating analysis to actionable recommendations

## Practical Applications

### Employment and HR
- **Bias auditing** in hiring practices
- **Fair employment** policy development
- **Recruitment optimization** strategies

### Financial Services
- **Credit risk modeling** for loan decisions
- **Interest rate pricing** based on risk factors
- **Portfolio risk management** strategies

### Academic Research
- **Discrimination studies** methodology
- **Causal inference** techniques
- **Confounding control** strategies

## Software Requirements

- **R** (version 4.0 or higher)
- **Required packages**: `dplyr`, `knitr`, base R stats
- **RStudio** recommended for R Markdown compilation

## Usage Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/username/logistic-regression-analysis.git
   ```

2. **Navigate to specific analysis**:
   ```bash
   cd analyses/callback-analysis/
   ```

3. **Open R Markdown file** in RStudio and knit to HTML

4. **Ensure data files** are in the same directory as the .Rmd file

## Reproducibility

All analyses are fully reproducible with:
- **Seed setting** for consistent results
- **Complete data** provided in CSV format
- **Documented code** with extensive comments
- **Step-by-step methodology** explanation

## Educational Context

These analyses were developed for **STAT 311: Statistical Methods** coursework, demonstrating:
- **Real-world applications** of statistical theory
- **Ethical considerations** in data analysis
- **Communication skills** for technical audiences
- **Critical thinking** about statistical evidence

## Future Extensions

Potential enhancements include:
- **Cross-validation** for model robustness
- **ROC curve analysis** for classification performance
- **Regularization techniques** (LASSO, Ridge regression)
- **Machine learning comparisons** (Random Forest, SVM)

## Contributors

- Primary Analysis: STAT 311 Student
- Template Development: Course Instruction Team
- Data Sources: Academic research datasets

## References

1. Bertrand, M. & Mullainathan, S. (2004). "Are Emily and Greg More Employable than Lakisha and Jamal?"
2. Bickel, P.J., Hammel, E.A., O'Connell, J.W. (1975). "Sex Bias in Graduate Admissions: Data from Berkeley"
3. James, G., Witten, D., Hastie, T., Tibshirani, R. (2013). "An Introduction to Statistical Learning"

## License

Educational use - Please cite if using for academic purposes

---

**Repository Goal**: Demonstrate comprehensive logistic regression analysis across multiple domains while highlighting the importance of ethical statistical practice and careful interpretation of results.
