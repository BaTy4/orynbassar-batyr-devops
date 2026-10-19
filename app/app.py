import os

name = os.getenv("STUDENT_NAME", "Batyr")
surname = os.getenv("STUDENT_SURNAME", "Orynbassar")
group = os.getenv("STUDENT_GROUP", "IT2-2308")
student_id = os.getenv("STUDENT_ID", "38316")

print("=" * 36)
print("DevOps Student Application")
print("=" * 36)
print(f"Name: {name}")
print(f"Surname: {surname}")
print(f"Group: {group}")
print(f"Student ID: {student_id}")
print()
print("Application is running successfully!")
