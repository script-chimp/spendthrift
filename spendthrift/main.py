import config

def main():
    print("Spendthrift Application")
    print(f"Development Mode: {config.is_dev}")
    print(f"Data Directory: {config.data_dir}")
    print(f"Raw Data Directory: {config.raw_data_dir}")
    print(f"Processed Data Directory: {config.processed_data_dir}")
    print(f"Review Data Directory: {config.review_data_dir}")
    print(f"Reports Directory: {config.reports_dir}")

if __name__ == "__main__":
    main()