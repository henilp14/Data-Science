import streamlit as st
import pandas as pd
import os
import numpy as np 

def save_to_excel(data, filename="student_marks.xlsx"): 
    if os.path.exists(filename): 
        existing_data = pd.read_excel(filename) 
        updated_data = pd.concat([existing_data, data], ignore_index=True) 
    else: 
        updated_data = data 
    updated_data.to_excel(filename, index=False) 

st.title("Student Marks Uploader") 

name = st.text_input("Enter your Name") 
college = st.text_input("Enter your College Name") 
uploaded_file = st.file_uploader("Upload marks file (CSV format with columns: Physics, Chemistry, Maths)", type=["csv"]) 

if uploaded_file is not None: 
    df = pd.read_csv(uploaded_file, na_values=["null", "NULL", "NaN"]) 

    if set(["Physics", "Chemistry", "Maths"]).issubset(df.columns): 
        df.insert(0, "Name", name)
        df.insert(1, "College", college) 

        if df.isnull().values.any():
            st.warning("Some missing values detected. Please check your file.") 

        save_to_excel(df) 
        st.success("Data successfully saved to Excel!")
        st.dataframe(df) 
    else: 
        st.error("Uploaded file must contain columns: Physics, Chemistry, Maths") 

st.write("\n**Note:** The Excel file will be updated with new entries upon each upload.")
