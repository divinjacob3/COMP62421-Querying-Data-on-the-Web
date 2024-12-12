# -*- coding: utf-8 -*-
"""Graph.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1HEOYuvW2mmKyDBzym2ppOu1m8SLqxZBW
"""

import matplotlib.pyplot as plt
import numpy as np

# Data: Query names, average times for optimised and unoptimised
queries = ['Auto Index Usage', 'Subquery', 'JOIN Order']
optimised_times = [0.0660, 0.0598, 1.1798]  # Average times for A (Optimised)
unoptimised_times = [0.8066, 5.2836, 7.2314]  # Average times for B (Unoptimised)

# Bar width
bar_width = 0.35

# Set positions for the bars
index = np.arange(len(queries))

# Create a figure and axes
fig, ax = plt.subplots(figsize=(10, 6))

# Plot bars
bar1 = ax.bar(index - bar_width/2, optimised_times, bar_width, label='Optimised (A)', color='b')
bar2 = ax.bar(index + bar_width/2, unoptimised_times, bar_width, label='Unoptimised (B)', color='r')

# Add labels, title, and customize ticks
ax.set_xlabel('Queries')
ax.set_ylabel('Average Execution Time (s)')
ax.set_title('Query Optimisation Comparison on Mondial10')
ax.set_xticks(index)
ax.set_xticklabels(queries, rotation=45)
ax.legend()

# Display the plot
plt.tight_layout()
plt.savefig('query_execution_times.png')
plt.show()

# Bar width
bar_width = 0.15

# Set positions for the bars
index = np.arange(len(queries))

# Create a figure and axes with 3 subplots (one for each query)
fig, axs = plt.subplots(1, 3, figsize=(15, 6))

# Loop over each query and plot separately
for i, query in enumerate(queries):
    # Plot bars for each query in the subplot
    axs[i].bar(index[i] - bar_width/2, optimised_times[i], bar_width, label='Optimised (A)', color='b')
    axs[i].bar(index[i] + bar_width/2 + 0.1, unoptimised_times[i], bar_width, label='Unoptimised (B)', color='r')

    # Set title and labels for each subplot
    axs[i].set_xlabel('Query Type')
    axs[i].set_ylabel('Average Execution Time (s)')
    axs[i].set_title(query + " Average Execution Time Comparison")

    # Set the tick positions: For each query, there are 2 bars, so set two ticks per subplot
    axs[i].set_xticks([index[i] - bar_width/2, index[i] + bar_width/2 + 0.1])  # Two tick positions for each query

    # Set the tick labels for Optimised and Unoptimised
    axs[i].set_xticklabels(['Optimised', 'Unoptimised'])  # Correct labels for two bars


# Adjust layout to avoid overlapping
plt.tight_layout()
plt.savefig('query_execution_times_sub_plots.png')
plt.show()