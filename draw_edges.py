{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "name": "draw.edges.py",
      "version": "0.3.2",
      "provenance": [],
      "collapsed_sections": [],
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/Yixiangzhang1996/2019Bio.Script.Test/blob/master/draw_edges.py\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "o6ZI48zJBZPd",
        "colab_type": "code",
        "colab": {}
      },
      "source": [
        "from PIL import Image\n",
        "import numpy as np\n",
        "import matplotlib.pyplot as plt\n",
        "import math\n",
        "\n",
        "filename = 'old.jpg'\n",
        "im = Image.open(filename)\n",
        "im_array = np.asarray(im)\n",
        "\n",
        "# square root difference between two pixels.\n",
        "def sqrt_diff(a,b):    \n",
        "    return math.sqrt(sum((int(a[i])-int(b[i]))**2 for i in range(3))/3)\n",
        "\n",
        "diff_threshold = 10\n",
        "new_array = np.copy(im_array)\n",
        "for row in range(im_array.shape[0]-1):\n",
        "    for col in range(im_array.shape[1]-1):\n",
        "        # change an edge pixel to black if it is much different from neighbours (right and below)\n",
        "        # otherwise change it to white as background\n",
        "        if ( sqrt_diff(im_array[row,col],im_array[row,col+1]) > diff_threshold\n",
        "            or sqrt_diff(im_array[row,col],im_array[row+1,col]) > diff_threshold):\n",
        "            new_array[row,col] = [0,0,0] # black\n",
        "        else:\n",
        "            new_array[row,col] = [255,255,255] # white\n",
        "            \n",
        "plt.imshow(new_array)\n",
        "plt.savefig('new.jpg')"
      ],
      "execution_count": 0,
      "outputs": []
    }
  ]
}