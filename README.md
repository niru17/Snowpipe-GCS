
# ❄️ Snowpipe Demo – Automated Data Loading to Snowflake

This project demonstrates how to automate the data loading process into Snowflake using **Snowpipe**. The SQL script provided sets up a Snowpipe pipeline that listens to a GCS (Google Cloud Storage) bucket for new data files and loads them automatically into a Snowflake table.

---

## 📄 Components

### ✅ SQL Script

- **snowpipe_demo.sql**: Contains all necessary SQL commands to:
  - Create a stage referencing GCS
  - Create a target table
  - Set up a Snowpipe using `COPY INTO` with `AUTO_INGEST`
  - Monitor data ingestion status

---

## 🖼️ Screenshots

The following screenshots capture key steps of the implementation:

| Screenshot | Description |
|-----------|-------------|
| ![Screenshot](./screenshots/Screenshot%202025-05-12%20at%208.45.51%E2%80%89PM.png) | Snowpipe table creation in Snowflake |
| ![Screenshot](./screenshots/Screenshot%202025-05-12%20at%208.45.59%E2%80%89PM.png) | Data file detection in GCS |
| ![Screenshot](./screenshots/Screenshot%202025-05-12%20at%208.46.07%E2%80%89PM.png) | COPY history showing successful ingestion |
| ![Screenshot](./screenshots/Screenshot%202025-05-12%20at%208.48.05%E2%80%89PM.png) | Auto-ingest pipe monitoring |
| ![Screenshot](./screenshots/Screenshot%202025-05-12%20at%208.49.12%E2%80%89PM.png) | Data preview after loading into the Snowflake table |

---

## 🚀 How It Works

1. Files are placed in a GCS bucket.
2. Snowpipe automatically detects new files via cloud messaging.
3. The pipe triggers and runs the `COPY INTO` command.
4. Data is inserted into the target Snowflake table.
5. You can track load history using the `information_schema.copy_history`.

---

## 🧪 Use Cases

- Real-time ingestion of transactional logs
- Continuous loading of CSV files from cloud buckets
- Automating ELT workflows in Snowflake

---

## 📂 Folder Structure

```
snowpipe_demo/
├── snowpipe_demo.sql
└── screenshots/
    ├── Screenshot 2025-05-12 at 8.45.51 PM.png
    ├── Screenshot 2025-05-12 at 8.45.59 PM.png
    ├── Screenshot 2025-05-12 at 8.46.07 PM.png
    ├── Screenshot 2025-05-12 at 8.48.05 PM.png
    └── Screenshot 2025-05-12 at 8.49.12 PM.png
```

---

## 📬 Author

Niranjana Subramanian  
*Graduate Student | Data Engineering Enthusiast*
