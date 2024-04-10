%% Calculate total preschool expenses for 2023--2024

clearvars;

%Specify tuition/fees and date range for school year
tuition = 410;
lunchFee = 10;
dateRange = datetime('1-Sep-2023'):datetime('30-Jun-2024');
lunchDayIdx = [2,3]; %["Mon","Tues"];
lunchStartDate = '1-Oct-2023'; %Only Oct--Jun

%Calculate school-dates excluding holidays
holidays = [...
    datetime('9-Oct-2023'),...
    ];
schoolDates = dateRange(ismember(weekday(dateRange),2:6));
schoolDates = schoolDates(~ismember(schoolDates,holidays));

%Count number of lunch days and multiply by fee
lunchRange = schoolDates(schoolDates>=datetime(lunchStartDate)); %Only Oct--Jun
dayNum = day(lunchRange,"dayofweek");
lunchDates = lunchRange(ismember(dayNum,lunchDayIdx));

%Sum monthly tuition with daily lunch fees
annualTuition = numel(unique(month(schoolDates)))*tuition;
lunchTotalFees = numel(lunchDates)*lunchFee;
totalExpenses = annualTuition +lunchTotalFees;

%Divided by week or month
expensesPerWeek = totalExpenses/numel(unique(week(schoolDates)));
expensesPerMonth = totalExpenses/numel(unique(month(schoolDates)));