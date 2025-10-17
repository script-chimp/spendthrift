import pandas as pd
from pathlib import Path
import config

CANONICAL_TRANSACTION_MODEL = [
    "date",
    "description",
    "amount",
    "balance",
    "category"
]

def load_csv(file_path: Path) -> pd.DataFrame:
    """Load a CSV file into a pandas DataFrame."""
    # Ensure the file exists
    if not Path(file_path).exists():
        raise FileNotFoundError(f"CSV file not found at {file_path}")
    
    # Load the CSV file into a DataFrame
    df = pd.read_csv(file_path)

    return df

def identify_transaction_format(df: pd.DataFrame) -> str:
    """Identify the transaction format based on its columns."""
    # Get the known transaction formats from the config
    csv_formats = config.transaction_formats

    # Get the columns of the DataFrame
    csv_columns = df.columns.tolist()

    # Check each known format
    for i, format_name in enumerate(csv_formats):
        if csv_columns == csv_formats.get(format_name, {}).get("columns", []):
            return format_name
    
    # If no format matches, return None
    return None

def transform_to_canonical(df: pd.DataFrame) -> pd.DataFrame:
    # Identify the transaction format
    format_name = identify_transaction_format(df)
    
    # Handle unsupported formats
    if format_name is None:
        raise ValueError("Unrecognized CSV format")
    
    # Create mappings for current format
    format_mapping = config.transaction_formats[format_name].get("mapping", {})

    df_canonical = df.rename(columns=format_mapping)

    # Select only the columns that are in the canonical model
    df_canonical = df_canonical[[col for col in CANONICAL_TRANSACTION_MODEL if col in df_canonical.columns]].copy()
    
    # Add missing columns with default values
    for col in CANONICAL_TRANSACTION_MODEL:
        if col not in df_canonical.columns:
            df_canonical[col] = None  # or some other default value
    
    return df_canonical

if __name__ == "__main__":
    # Example usage
    raw_file_path = config.raw_data_dir / "accountActivityExport (1).csv"
    df_raw = load_csv(raw_file_path)
    df_canonical = transform_to_canonical(df_raw)
    print(df_canonical.head())