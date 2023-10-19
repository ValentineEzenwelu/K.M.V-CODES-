import pathlib

path3 = pathlib.Path.cwd()

Practice_files_folder = path3 / "Practice_files_folder"
Practice_files_folder.mkdir(exist_ok=True)
print(Practice_files_folder)  # To print the file path

file_paths = [
    Practice_files_folder / "image1.png",
    Practice_files_folder / "image2.gif",
    Practice_files_folder / "image3.png",
    Practice_files_folder / "image4.jpg"
]

for path in file_paths:
    path.touch()

for file in Practice_files_folder.iterdir():
    print(file.name)

images = path3 / "Practice_files_folder" / "images"
images.mkdir(exist_ok=True)

source = pathlib.Path(
    r"C:\Users\Admin\PycharmProjects\pythonProjects\Python_Assignments\Practice_files_folder\image1.png")  # file path
destination = path3 / "Practice_files_folder" / "images" / "image1.png"  # Destination path
source.replace(destination)
print(source)
print(source.exists())

source2 = pathlib.Path(
    r"C:\Users\Admin\PycharmProjects\pythonProjects\Python_Assignments\Practice_files_folder\image2.gif")
destination2 = path3 / "Practice_files_folder" / "images" / "image2.gif"
source2.replace(destination2)

source3 = pathlib.Path(
    r"C:\Users\Admin\PycharmProjects\pythonProjects\Python_Assignments\Practice_files_folder\image3.png")
destination3 = path3 / "Practice_files_folder" / "images" / "image3.png"
source3.replace(destination3)

source4 = pathlib.Path(
    r"C:\Users\Admin\PycharmProjects\pythonProjects\Python_Assignments\Practice_files_folder\image4.jpg")
destination4 = path3 / "Practice_files_folder" / "images" / "image4.jpg"
source4.replace(destination4)
