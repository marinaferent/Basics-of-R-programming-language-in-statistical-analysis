This is a repository for the course *Basics of R programming language in statistical analysis*. In 2020 and 2021, I instructed the course free of charge to a selected
number of UBB FSEGA graduates in collaboration with Multicultural Business Institute. The materials in this repository belong to the 2021 edition.

## Course aims

- Differentiating between different R objects (vector,
  matrix, data frame, list) – generating the objects, properties,
  operations
- Visualizing data using base R graphics – bar charts, pie charts,
  histograms, scatter plots, line charts
- Analyzing data using predefined R functions – statistical measures,
  correlations, linear regression
- Writing an R code that uses control structures – for loops,
  conditional statements
- Writing user defined functions – applications on writing the functions
  for: statistical measures, correlations, linear regression

Upon completion of this course, the participants are independent R
users, being able to understand R code, write functions, and debug.
Also, they will be able to perform a statistical analysis in R
(visualizing, computing statistical measures, performing cross tab
analysis, and linear regressions).

**Prerequisites:** Base knowledge of descriptive statistics and
introductory econometrics terms (statistical population, sample size,
statistical variables, mean, median, mode, correlation, linear
regression).

## Course structure

8 online meetings of 1h 30min each.

**Meetings 1-2: Basic notions**

*A. R STRUCTURES, PROPERTIES AND OPERATIONS: Vectors and Data Frames \|
Numerical representation of attributive variables:*

- defining a vector, operations with vectors, vector properties,
  computing absolute, relative frequencies
- defining a matrix, operations with matrices, matrix properties
- reading-writing a .csv file, setting a working directory
- generating random variables

*B. R GRAPHS \| Graphical representation of attributive variables:*

- bar charts, pie charts, histograms

*Additionally proposed exercises cover:* lists, data extraction, grouped
bar charts.

**Meetings 3-6: CONTROL STRUCTURES AND FUNCTIONS \| Statistical
measures**

*A.FOR LOOPS \| Challenge: Mean values*

- for loops, mean(), colMeans()
- compute the mean value of the values of a vector using functions sum()
  and length()
- compute the mean value for each column in a matrix using for loops and
  the functions sum() and length(), nrow() etc.

*B.CONDITIONAL STATEMENTS \| Challenge: Median values*

- conditional statements, median(), matrixStats::colMedians()
- compute the median value of the values of a vector using if
  statements, and length(), sort(), trunc() etc.
- compute the median value for each column in a matrix using for loops,
  if statements, and length(), sort(), trunc() etc.

*C.FUNCTIONS \| Challenge: Mode values*

- function()
- write a function that returns the mode of the values of a vector along
  with the text “the mode is”

*Additionally proposed exercises cover:* variance, standard deviation,
coefficient of variation, quartiles, skewness, kurtosis, automatic
interpretation of results, data extraction, data normalization, rolling
windows.

**Meetings 7-8: INDEPENDENT R CODING \| Relations between statistical
variables**

*A. Cross-tab analysis*

Participants receive a database and have 45 minutes to:

- Perform a cross-tab analysis between two quatitative variables
  (scatter plot, Pearson’s correlation coefficient)
- Automate one interpretation/reporting aspect of their cross-tab
  analysis - this could include, but is not restricted to:
  - Export your graph into a .pdf, .png etc. file.
  - Based on Pearson’s correlation coefficiend and a conditional
    statement of one’s choice print: “Positive/Negative/No correlation”;
    “High/medium/low correlation”; “low positive correlation”, “low
    negative correlation” etc.; The correlation is 0.24 =\> low positive
    correlation between salary and salbegin” etc.
  - Save into a matrix and export into a .csv file the value of
    Pearson’s correlation coefficient and the interpretation
  - Add the Pearson’s correlation coefficient value (and the
    interpretation) on the scatter plot.
  - Create an interpretation function.
  - Compute the correlation matrix for all the (the quantitative
    continuous/) variables in the data set.
  - Using a for loop, plot the scatter plots of multiple variables.

*B. Linear regression model*

Participants receive a database and have 45 minutes to:

- Run a linear regression and name it regression.
- Check one of the assumptions of the linear model: linearity of the
  model, no perfect or near multicolinearity, homoskedasticity errors,
  normality of the residuals.
- Perform one of the:
  - Plot the dependent variable against an independent variable and add
    the regression line/against all the quantitative independent
    variables (for loop) and store all the scatter plots into a single
    .pdf file
  - Store the correlation matrix/the regression results into a .csv file
    locally.
  - Interpret the result of the test of the assumptions of the linear
    model (conditional statement), R-squared, coefficients, a
    coefficient - if statistically significant etc.

## Additionally proposed exercises

For each meeting, I provide a list of proposed extra-exercises for those
interested (*rBasics_Meeting no.\_exercises.pdf*). These exercises are
of 4 types (hopefully supporting many different learning styles):

1.  Comment
2.  Reproduce
3.  Produce
4.  Debug

To cover the diverse backgrounds and interests of the participants,
these exercises included short examples of:

- Data extraction (from a .pdf file, Yahoo, Eurostat)
- Creating sub-datasets with rolling windows
- Data pre-processing (normalization)

#### Acknowledgements

##### Datasets

Throughout this course I used two data sets (slightly altered to meet
the course’s purposes) from *Wooldridge, Jeffrey M. (2013). Introductory
econometrics: a modern approach. Mason, Ohio: South-Western Cengage
Learning*, namely:

- campus - Campus crimes.csv (Meetings 3-6)
- engin - Wages.csv (Meetings 7-8)

The original data sets are available at:

1.  <https://www.cengage.com/cgi-wadsworth/course_products_wp.pl?fid=M20b&product_isbn_issn=9781111531041>
2.  <https://cran.r-project.org/web/packages/wooldridge/wooldridge.pdf>

##### Course structure and coding style

My teaching style is highly influenced by the ones of my excellent
professors and colleagues at UBB FSEGA, in particular by professor
Cristian Litan. Also, I am grateful to Anna Keresztes and Marcos
Dominguez for their positive influence on my coding style while working
together.
