This project attempts to replicate the analysis in the 2002 paper, "[Dictatorial Peace?](http://www.jstor.org/stable/3117807)", using updated data for the final assignment in my spring 2022 course, Authoritarianism, taught by Professor Lisa Anderson.  The original paper attempts to use the regime types of a pair of countries (a.k.a. a dyad) to explain the likelihood the dyad will engage in a militarized interstate dispute (MID) during a given year.  In order to replicate the findings, I create a new directed dyad-year dataset, drawing from updated versions of the same data used in the original paper, which include the following:

| Data | Original Data Source| New Data Source|
|------|---------------------|----------------|
| Militarized Interstate Disputes<br>(MIDs) | Correlates of War MID 3 | [Correlates of War MID 5](https://correlatesofwar.org/data-sets/MIDs/mid-5-data-and-supporting-materials.zip/view),<br>specifically MIDB v5 |
| Regime Type Classification<br>    Autocracies<br>    Democracies | <br>Geddes (1999a)<br>Polity IIId | <br>[Geddes et al. (2014)](https://sites.psu.edu/dictators/)<br>Geddes et al. (2014)|
| Correlates of War<br>National Material Capabilities (NMC)<br>1. Primary Energy Consumption (PEC)<br>2. Composite Indicators / Index of National Capabilities (CINC) | Correlates of War NMC | Correlates of War [NMC v6](https://correlatesofwar.org/data-sets/national-material-capabilities/nmc_documentation-6-0.zip/view) |
| Remaining Control Variables | Unspecified | Correlates of War datasets<br>as accessed via the R package<br>[peacesciencer](https://github.com/svmiller/peacesciencer):<br>1. Alliances<br>2. Contiguities<br>3. Member States |

After creating the data, I perform basic analysis to replicate the original findings of the paper.  While the control coefficients are largely similar to the findings in the original paper, the main explanatory coefficients on regime types vary in magnitude and direction.  As some of the data processing is not explicitly stated in the original paper, the preparation of data diverges slightly, especially regarding the measure for relative economic development in a given year.  This may affect the comparability of the results, and should be reviewed in the future.

The data for the project is provided publicly in this github repository for validation purporses and in the name of transparency and reproducability.

# Bibliography

Barbara Geddes, Joseph Wright, and Erica Frantz. 2014. “Autocratic Breakdown and Regime Transitions: A New Data Set.” Perspectives on Politics 12(2): 313-331.  Available at https://www.cambridge.org/core/journals/perspectives-on-politics/article/autocratic-breakdown-and-regime-transitions-a-new-data-set/EBDB9E5E64CF899AD50B9ACC630B593F.

“National Material Capabilities (v6.0) — Correlates of War.” Folder. Accessed May 7, 2022. https://correlatesofwar.org/data-sets/national-material-capabilities.

Palmer, Glenn, Roseanne W. McManus, Vito D’Orazio, Michael R. Kenwick, Mikaela Karstens, Chase Bloch, Nick Dietrich, Kayla Kahn, Kellan Ritter, Michael J. Soules. 2020. "The MID5 Dataset, 2011-2014: Procedures, Coding Rules, and Description." Working paper. Available at https://correlatesofwar.org/data-sets/MIDs/mid-5-data-and-supporting-materials.zip/view.

Peceny, Mark, Caroline C. Beer, and Shannon Sanchez-Terry. “Dictatorial Peace?” The American Political Science Review 96, no. 1 (2002): 15–26. http://www.jstor.org/stable/3117807.
