import pandas as pd

def find_patients(patients: pd.DataFrame) -> pd.DataFrame:
    reg = r'(^DIAB1)|( DIAB1)'
    diab1 = patients[patients.conditions.str.contains(reg, regex=True)]

    return(diab1)