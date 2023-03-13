from setuptools import setup, find_packages

install_requires = [
    "boto3<2.0",
    "pandas>=1.2.5,<2.0",
]


setup(
    install_requires=install_requires,
    name = 'autogluon.bench',
    packages = find_packages("src"),
    package_dir ={"": "src"},
)