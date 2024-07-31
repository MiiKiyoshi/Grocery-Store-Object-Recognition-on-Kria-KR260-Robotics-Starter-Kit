# Grocery Store Object Recognition on Kria KR260 Robotics Starter Kit

This project demonstrates the implementation of an object recognition system for grocery store products using the Kria KR260 Robotics Starter Kit. The process includes fine-tuning a pre-trained model, quantization, compilation, and deployment on the KR260 board.

## Project Overview

1. **Data Preparation**: Prepare the grocery store dataset for training.
2. **Transfer Learning**: Fine-tune a pre-trained ResNet50 model on the prepared dataset.
3. **Model Inspection**: Verify compatibility of each layer with the Vitis AI DPU IP.
4. **Quantization**: Optimize the fine-tuned model for improved efficiency.
5. **Compilation**: Prepare the quantized model for the Kria KR260 board.
6. **Deployment**: Run the compiled model on the Kria KR260 Robotics Starter Kit.

## Project Structure

```
.
├── compile_resnet50_grocery.sh
├── compiled_model/
│   ├── compiled_resnet50_grocery.xmodel
│   ├── md5sum.txt
│   └── meta.json
├── float_model/
│   ├── train_resnet50_grocery_best_chkpt.h5
│   └── train_resnet50_grocery_final.h5
├── grocery_store_dataset/
│   ├── new/
│   └── original/
├── inspect_resnet50_grocery.ipynb
├── kr260.json
├── logs/
│   ├── compile_log.txt
│   ├── inspect_results.txt
│   ├── model.svg
│   ├── quantized_inspect_results.txt
│   ├── quantized_model.svg
│   ├── train_resnet50_grocery_history.png
│   └── train_resnet50_grocery_model.png
├── prepare_grocery_dataset.ipynb
├── quant_model/
│   └── quantized_resnet50_grocery.h5
├── quantize_resnet50_grocery.ipynb
├── run_resnet50_grocery_kr260.ipynb
├── train_resnet50_grocery.ipynb
├── train_resnet50_grocery_colab.ipynb
└── webcam/
    ├── Apple.jpg
    ├── Pepper.jpg
    ├── Tomato.jpg
    └── webcam.jpg
```

## Dataset

This project uses the "Grocery Store Dataset" from Kaggle. Due to size constraints, the dataset is not included in this repository. Please follow these steps to set up the dataset:

1. Download the dataset from Kaggle: [Grocery Store Dataset (kaggle.com)](https://www.kaggle.com/datasets/validmodel/grocery-store-dataset/data)
2. Extract the downloaded zip file
3. Place the contents of the `dataset` folder from the extracted files into the `grocery_store_dataset/original/` directory in this project

### Dataset Preparation

After downloading and placing the dataset files, use the `prepare_grocery_dataset.ipynb` notebook to process the data:

1. Open `prepare_grocery_dataset.ipynb`
2. Run the notebook to organize the dataset
3. The processed dataset will be saved in the `grocery_store_dataset/new/` directory

This step ensures that the data is properly organized for training the model.

## How to Use This Project

1. **Data Preparation**: 
   - Follow the steps in the Dataset section above
   - Use `prepare_grocery_dataset.ipynb` to organize the data

2. **Fine-tuning**: 
   - Use `train_resnet50_grocery.ipynb` or `train_resnet50_grocery_colab.ipynb` (for Google Colab)
   - Note: `train_resnet50_grocery_colab.ipynb` has been optimized with adjusted batch sizes for Colab's T4 GPU (free tier)

3. **Model Inspection**: 
   - Use `inspect_resnet50_grocery.ipynb`
   - This crucial step verifies each layer's compatibility with the Vitis AI DPU IP
   - Determines whether each layer will run on the CPU or DPU

4. **Quantization**: 
   - Use `quantize_resnet50_grocery.ipynb`
   - Quantizes the fine-tuned model for improved efficiency on the KR260

5. **Compilation**: 
   - Run `compile_resnet50_grocery.sh`
   - Compiles the quantized model specifically for the Kria KR260 board
   - Uses `kr260.json`, which contains the DPU architecture fingerprint (0x101000016010407) for the KR260

6. **Deployment**: 
   - Use `run_resnet50_grocery_kr260.ipynb`
   - Guides you through running the object recognition model on the Kria KR260 Robotics Starter Kit

## Kria KR260 Robotics Starter Kit Implementation

This project implements a grocery store object recognition model on the Kria KR260 Robotics Starter Kit. The model is optimized and compiled to run on the KR260's DPU (Deep Learning Processing Unit).

## Webcam Integration and Results

The `webcam/` directory contains sample images captured using a USB webcam connected to the KR260 board. These images are processed in the last cell of `run_resnet50_grocery_kr260.ipynb`. The object recognition results are saved as JPEG files, with the detected category name and a number suffix.

Here are the sample results with their processing times:

1. Apple.jpg
   - Pre-processing time: 4.33 ms
   - DPU execution time: 17.13 ms
   - Post-processing time: 0.33 ms

2. Pepper.jpg
   - Pre-processing time: 4.84 ms
   - DPU execution time: 17.29 ms
   - Post-processing time: 0.35 ms

3. Tomato.jpg
   - Pre-processing time: 4.66 ms
   - DPU execution time: 17.16 ms
   - Post-processing time: 0.35 ms

## Requirements

- TensorFlow 2.x
- Vitis AI-TensorFlow 2 (for DPU compatibility inspection, quantization, and compilation)
- Kria KR260 Robotics Starter Kit (for deployment)

## Logs and Visualization

The `logs/` directory contains various log files and visualizations, including:
- Compilation logs
- Inspection results for both float and quantized models
- Model architecture visualizations
- Training history and model plots

These logs and visualizations can be useful for debugging and understanding the model's performance.

## License

This project uses the "Grocery Store Dataset" which is distributed under the MIT License. The full text of the MIT License can be found at: https://opensource.org/licenses/MIT

## References

"Running ResNet18 CNN Through Vitis AI 3.5 Flow for ML" from the Vitis-AI Tutorials repository. Available at: https://github.com/Xilinx/Vitis-AI-Tutorials/tree/3.5/Tutorials/RESNET18/