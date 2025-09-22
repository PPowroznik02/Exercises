import pandas as pd

def concatenateTables(df1: pd.DataFrame, df2: pd.DataFrame) -> pd.DataFrame:
    concat_dfs = pd.concat([df1, df2])

    return(concat_dfs)