unit myResourceStrings;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, LocalizedForms;

    resourceString
        rsInvalidOpera = 'Invalid Operator';
        // WEEK DAYS
        rsSunday = 'Sunday';
        rsMonday = 'Monday';
        rsTuesday = 'Tuesday';
        rsWednesday = 'Wednesday';
        rsThursday = 'Thursday';
        rsFriday = 'Friday';
        rsSaturday = 'Saturday';
        // MONTH DAYS
        rsOne = 'one';
        rsTwo = 'two';
        rsThree = 'three';
        rsFour = 'four';
        rsFive = 'five';
        rsSix = 'six';
        rsSeven = 'seven';
        rsEight = 'eight';
        rsNine = 'nine';
        rsTen = 'ten';
        rsEleven = 'eleven';
        rsTwelve = 'twelve';
        rsThirteen = 'thirteen';
        rsFourteen = 'fourteen';
        rsFifteen = 'fifteen';
        rsSixteen = 'sixteen';
        rsSeventeen = 'seventeen';
        rsEighteen = 'eighteen';
        rsNineteen = 'nineteen';
        rsTwenty = 'twenty';
        rsTwentyOne = 'twenty one';
        rsTwentyTwo = 'twenty two';
        rsTwentyThree = 'twenty three';
        rsTwentyFour = 'twenty four';
        rsTwentyFive = 'twenty five';
        rsTwentySix = 'twenty six';
        rsTwentySeven = 'twenty seven';
        rsTwentyEight = 'twenty eight';
        rsTwentyNine = 'twenty nine';
        rsThirty = 'thirty';
        rsThirtyOne = 'thirty one';
        // MONTHS
        rsJanuary = 'January';
        rsFebruary = 'February';
        rsMarch = 'March';
        rsApril = 'April';
        rsMay = 'May';
        rsJune = 'June';
        rsJuly = 'July';
        rsAugust = 'August';
        rsSeptember = 'September';
        rsOctober = 'October';
        rsNovember = 'November';
        rsDecember = 'December';
        // MISC DATE STRINGS
        rsOf = ' of ';
        rsEndDate = 'End date';
        rsStartDate = 'Start date';
        rsDatesAreTheS = 'Dates are the same';
        rsYear = ' year.';
        rsYears = ' years.';
        rsMonth = ' month.';
        rsMonthAnd = ' month and ';
        rsDay = ' day.';
        rsDayAnd = ' day and ';
        rsDay2 = ' day, ';
        rsMonths = ' months.';
        rsDaysAnd = ' days and ';
        rsDays = ' days, ';
        rsDays2 = ' days.';
        //TREEVIEW NAMES
        rsTrViewDesc = 'Description';
        rsTrViewSimple = 'Simple';
        rsTrViewMisc = 'Miscellaneous';
        rsTrViewTrig = 'Trigonometric';
        rsTrViewDate = 'Date';
        rsTrViewSettings = 'Settings';
        // DESCRIPTION HELP STRINGS
        rsHelpDescLine0 = 'This is yet another multi-function calculator.';
        rsHelpDescLine2 = 'The type of calculations is chosen from the four radio buttons right below the results screen.';
        rsHelpDescLine4 = 'For single number calculations, choose the number and click the desired function name.';
        rsHelpDescLine6 = 'For calculations requiring two numbers, choose the first number, choose the function, and then choose the second number.';
        rsHelpDescLine8 = 'There is a small section where you can change the theme and/or the language, via menu Edit -> Settings.';
        //SIMPLE HELP STRINGS
        rsHelpSimpleLine0 = 'This is the regular arithmetic calculator. Does basic functions, like adding, subtracting, multiplying and dividing.';
        rsHelpSimpleLine2 = 'The remainder function (REMDR) gives the remainder of an integer division.';
        rsHelpSimpleLine4 = 'You can add the present value to memory with M+, add another value with another M+, subtract the present value from whatever is in memory, or clear the memory.';
        rsHelpSimpleLine6 = 'Be aware, if there is nothing in memory, with M- the present value will be stores as a negative value.';
        // MISCELLANEOUS FUNTIONS HELP STRINGS
        rsHelpMiscLine0 = 'Here we have several commonly used functions and converters. Some require two arguments, most only one.';
        rsHelpMiscLine2 = '% and ‰ divide the number by 100 and 1000, respectively. x raised to y needs two numbers, the base (first number) and the exponent. As soon as you click the button, you will be redirected to the numeric keypad to enter the exponent.';
        rsHelpMiscLine4 = 'Same thing happens with the nth root, exponential or logarythm functions. For the factorial, or the fraction of one, we need only one number.';
        rsHelpMiscLine6 = 'For convenience, there are available trhee well known constants, Pi, Euler and Tau.';
        rsHelpMiscLine8 = 'The four rightmost buttons pick the entered number and ask for the base to convert it to, assuming the number was entered in the base the button shows.';
        rsHelpMiscLine10 = 'The other buttons are converters, they pick the first number and convert it as shown.';
        // TRIGONOMETRIC FUNCTIONS HELP STRINGS
        rsHelpTrigLine0 = 'These are the most common trigonometric functions. Tehy pick the entered number and calculate the respective function.';
        rsHelpTrigLine2 = 'The exception being the hypothenuse calculation (Hyp button), tha requires two operands.';
        rsHelpTrigLine4 = 'There are also six converters between several angle measurement units.';
        // DATES HELP STRINGS
        rsHelpDateLine0 = 'Here we can convert any date from one calendar to another. We do so by choosing a calendar using the first button. The default is the gregorian calendar. After that, we pick a date using the selector, and end with using the second button to select the target calendar.';
        rsHelpDateLine1 = 'The result will be presented below in full.';
        rsHelpDateLine3 = 'We can also calculate the difference between two dates using the appopriate selectors. The calculation is shown at the bottom.';
        rsHelpDateLine4 = 'If the start date is later than the end date, the labels will switch position and the end date painted in red.';
        // SETTINGS HELP STRINGS
        rsHelpSettingsLine0 = 'Click on the down arrow of the first list to select a language.';
        rsHelpSettingsLine2 = 'Click on the down arrow of the second list and select a theme, dark or light.';

        rsDateConverted = '%s';

implementation

end.

