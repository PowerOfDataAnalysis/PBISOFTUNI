# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "83edc301-a168-4d6b-b1ce-8280621e913a",
# META       "default_lakehouse_name": "SoftUni",
# META       "default_lakehouse_workspace_id": "f7750814-3e39-485b-ac87-6b7d059fdeb1",
# META       "known_lakehouses": [
# META         {
# META           "id": "83edc301-a168-4d6b-b1ce-8280621e913a"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!
from pyspark.sql import functions as F

# ----------------------------
# Parameters
# ----------------------------
start_date = "2024-01-01"
end_date   = "2026-12-31"
table_name = "Calendar"

# Optional: schema-style name if you use it in Fabric
full_table_name = f"dbo.{table_name}"

# ----------------------------
# Create calendar DataFrame
# ----------------------------
calendar_df = (
    spark.sql(f"""
        SELECT explode(
            sequence(to_date('{start_date}'), to_date('{end_date}'), interval 1 day)
        ) AS Date
    """)
    .withColumn("Year", F.year("Date"))
    .withColumn("Month", F.month("Date"))
    .withColumn("MonthName", F.date_format("Date", "MMMM"))
    .withColumn("MonthShort", F.date_format("Date", "MMM"))
    .withColumn("MonthYear", F.date_format("Date", "MM.yyyy"))
    .withColumn("Quarter", F.quarter("Date"))
    .withColumn("Day", F.dayofmonth("Date"))
    .withColumn("DayOfWeek", F.dayofweek("Date"))   # 1=Sunday, 7=Saturday
    .withColumn("DayName", F.date_format("Date", "EEEE"))
    .withColumn("WeekOfYear", F.weekofyear("Date"))
    .withColumn("YearMonthNum", F.col("Year") * 100 + F.col("Month"))
    .withColumn("IsWeekend", F.when(F.dayofweek("Date").isin(1, 7), 1).otherwise(0))
    .withColumn("StartOfMonth", F.trunc("Date", "month"))
    .withColumn("EndOfMonth", F.last_day("Date"))
    .withColumn("StartOfYear", F.to_date(F.concat(F.col("Year"), F.lit("-01-01"))))
    .withColumn("EndOfYear", F.to_date(F.concat(F.col("Year"), F.lit("-12-31"))))
)

# ----------------------------
# Write to Lakehouse as Delta table
# ----------------------------
calendar_df.write \
    .format("delta") \
    .mode("overwrite") \
    .saveAsTable(full_table_name)

# Check result
display(spark.table(full_table_name))

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
