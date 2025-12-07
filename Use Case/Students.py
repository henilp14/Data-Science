import streamlit as st
import pandas as pd
import os
import numpy as np

# Function to save data to Excel
def save_to_excel(data, filename="student_marks.xlsx"):
    if os.path.exists(filename):
        existing_data = pd.read_excel(filename)
        updated_data = pd.concat([existing_data, data], ignore_index=True)
    else:
        updated_data = data
    updated_data.to_excel(filename, index=False)

# Function to suggest universities based on percentage
def suggest_universities(percentage):
    if percentage >= 90:
        return ["University A", "University B", "University C (Top-tier)"]
    elif 75 <= percentage < 90:
        return ["University D", "University E", "University F"]
    elif 50 <= percentage < 75:
        return ["University G", "University H"]
    elif 33 <= percentage < 50:
        return ["University I", "University J (Focus on skill-based programs)"]
    else:
        return ["Focus on improving academic skills. Consider tutorial centers or foundational programs."]

# Initialize session state for dynamic input
if "inputs" not in st.session_state:
    st.session_state.inputs = [{}]  # Start with one empty input
if "dataframes" not in st.session_state:
    st.session_state.dataframes = []  # Store dataframes for each entry

# App title
st.title("Student Marks Uploader")

# Add More Button
if st.button("Add More"):
    st.session_state.inputs.append({})  # Add a new input dictionary

# Input sections for all students
uploaded_file = st.file_uploader("Upload marks file (CSV format with columns: Physics, Chemistry, Maths)", type=["csv"])
for i, _ in enumerate(st.session_state.inputs):
    st.header(f"Student {i + 1}")
    name = st.text_input(f"Enter Name for Student {i + 1}", key=f"name_{i}")
    email = st.text_input(f"Enter Email Address for Student {i + 1}", key=f"email_{i}")
    college = st.text_input(f"Enter College Name for Student {i + 1}", key=f"college_{i}")
    school = st.text_input(f"Enter School Name (12th) for Student {i + 1}", key=f"school_{i}")

    if uploaded_file is not None:
        df = pd.read_csv(uploaded_file, na_values=["null", "NULL", "NaN"])

        # Validation for required columns
        if set(["Physics", "Chemistry", "Maths"]).issubset(df.columns):
            df.insert(0, "Name", name)
            df.insert(1, "Email", email)
            df.insert(2, "College", college)
            df.insert(3, "School", school)

            # Calculate Total Marks and Percentage
            df["Total Marks"] = df[["Physics", "Chemistry", "Maths"]].sum(axis=1)
            df["Percentage"] = (df["Total Marks"] / 300) * 100  # Assuming 100 marks per subject

            # Add Pass/Fail column
            df["Pass/Fail"] = df.apply(lambda row: "Pass" if row["Physics"] >= 33 and row["Chemistry"] >= 33 and row["Maths"] >= 33 else "Fail", axis=1)

            # Calculate Ranking as Percentage
            df["Ranking Percent"] = df["Percentage"].rank(pct=True) * 100  # Percentage rank

            # Store the dataframe in the session state
            st.session_state.dataframes.append(df)

        else:
            st.error(f"Uploaded file must contain columns: Physics, Chemistry, Maths for Student {i + 1}")

# Submit Button
if st.button("Submit"):
    if st.session_state.dataframes:
        # Combine all dataframes and save to Excel
        final_df = pd.concat(st.session_state.dataframes, ignore_index=True)
        save_to_excel(final_df)

        st.success("All data has been successfully saved to Excel!")
        st.dataframe(final_df)

        # Display ranking and suggestions for the last entered student
        student_percentage = final_df.iloc[-1]["Percentage"]
        student_rank = final_df.iloc[-1]["Ranking Percent"]
        suggested_universities = suggest_universities(student_percentage)

        st.info(f"You are better than {student_rank:.2f}% of the students.")
        st.markdown(f"### Suggested Universities for You:")
        for university in suggested_universities:
            st.write(f"- {university}")

    else:
        st.error("No data available to submit. Please add at least one student entry.")
