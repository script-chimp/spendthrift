import toml
from pathlib import Path

# Define the path to the configuration file
CONFIG_PATH = Path(__file__).parent.parent / "config.toml"

# Check if the configuration file exists
if not CONFIG_PATH.exists():
    raise FileNotFoundError(f"Configuration file not found at {CONFIG_PATH}")

# Load the configuration file
config = toml.load(CONFIG_PATH)

# Extract configuration values with defaults
# General settings
is_dev = config.get("general", {}).get("is_dev", True)
# Data directories
base_path = config.get("paths", {}).get("base_data_dir", Path(__file__).parent.parent)
data_dir = Path(base_path / config.get("paths", {}).get("data_dir", "data")).resolve()
raw_data_dir = Path(base_path / config.get("paths", {}).get("raw_data_dir", "data/raw")).resolve()
processed_data_dir = Path(base_path / config.get("paths", {}).get("processed_data_dir", "data/processed")).resolve()
review_data_dir = Path(base_path / config.get("paths", {}).get("review_data_dir", "data/review")).resolve()
reports_dir = Path(base_path / config.get("paths", {}).get("reports_dir", "reports")).resolve()
# Transaction format settings
transaction_formats = config.get("transaction_formats", {})