import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:
    employee = employee.drop_duplicates(subset=['salary'])

    if len(employee) >= N:
        nth = employee.sort_values(by=['salary'], ascending=True)
        nth = nth.head(N)
        nth = nth.sort_values(by=['salary'], ascending=False)
        nth[f'getNthHighestSalary({N})'] = nth.salary.head(1)

        nth = nth[[f'getNthHighestSalary({N})']].iloc[[0]]

        return(nth)

    else:
        return(pd.DataFrame({f'getNthHighestSalary({N})': [None]}))