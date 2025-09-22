import pandas as pd

def valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    valid_email_pattern = r"^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$"

    valid_users = users[users["mail"].str.match(valid_email_pattern, na=False)]

    return(valid_users)