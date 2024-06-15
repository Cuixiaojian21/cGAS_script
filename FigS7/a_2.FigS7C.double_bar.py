import pandas as pd
import matplotlib.pyplot as plt
import sys
from matplotlib.backends.backend_pdf import PdfPages

def set_max_value(matrix):
    f_max = lambda x: x if abs(x) <= 10 else 10*x/abs(x)
    col_list = ['strength']
    for i in col_list:
        matrix[i] = matrix[i].apply(f_max)
    return matrix

data = pd.read_csv('2_5_for_2bar.tsv', sep='\t')
data = set_max_value(data)
data_up = data[(data['up/down']=="up")]
data_up = data_up.sort_values(by=['strength'])
data_up.reset_index(drop=True, inplace=True)
data_down = data[(data['up/down']=="down")]
data_down = data_down.sort_values(by=['strength'])
data_down.reset_index(drop=True, inplace=True)

plt.figure(figsize=(3, 8))
region = data_up['Gene']
up = data_up['strength']
plt.barh(region, up, color='#ED7D31', height=0.8, label='up')
region = data_down['Gene']
down = data_down['strength']*-1
plt.barh(region, down, color='#4876CA', height=0.8, label='down')

plt.tick_params(width=1, labelsize=4, pad=5, length=2, left=False)

plt.yticks(ha='center', fontproperties='arial', fontsize=8)

plt.xticks([-8,-4,0,4,8], ha='center', fontproperties='arial', fontsize=8)
plt.ylabel('Protein', labelpad=2)
plt.xlabel('Abundance variation', labelpad=2)
ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['bottom'].set_linewidth(1)
ax.spines['left'].set_linewidth(False)
plt.legend(('up', 'down'),loc="upper center", bbox_to_anchor=(0.9, 0.9),
           prop={'size': 8}, frameon=False)
plt.subplots_adjust(left=0.2, bottom=0.05, right=0.98, top=0.98)
plt.savefig('FigS7C.svg', format='svg',dpi=800)
plt.close()
