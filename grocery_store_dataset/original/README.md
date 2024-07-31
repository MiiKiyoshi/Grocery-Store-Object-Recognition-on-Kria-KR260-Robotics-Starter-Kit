This project uses the "Grocery Store Dataset" from Kaggle. Due to size constraints, the dataset is not included in this repository. Please follow these steps to set up the dataset:

1. Download the dataset from Kaggle: [Grocery Store Dataset (kaggle.com)](https://www.kaggle.com/datasets/validmodel/grocery-store-dataset/data)
2. Extract the downloaded zip file
3. Place the contents of the `dataset` folder from the extracted files into the `grocery_store_dataset/original/` directory in this project

After downloading and placing the dataset files, use the `prepare_grocery_dataset.ipynb` notebook to process the data:

1. Open `prepare_grocery_dataset.ipynb`
2. Run the notebook to organize the dataset
3. The processed dataset will be saved in the `grocery_store_dataset/new/` directory

This step ensures that the data is properly organized for training the model.