import os
import shutil

def run():
    name = input("Enter your Flutter project name: ")
    target_dir = os.path.join(os.getcwd(), name)

    template_dir = os.path.join(os.path.dirname(__file__), "template_project")

    if os.path.exists(target_dir):
        print("❌ Folder already exists!")
        return

    shutil.copytree(template_dir, target_dir)

    print(f"✅ Flutter project '{name}' created successfully!")