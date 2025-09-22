import pandas as pd
import numpy as np

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:
    bonus = employees.assign(
        bonus = np.where(
            (employees['employee_id'] % 2 != 0) &
            (employees['name'].str[0] != 'M'),
            employees['salary'],
            0
        )
    )

    bonus = bonus.drop(columns=['name', 'salary']).sort_values(by=['employee_id'])
        
    return(bonus)