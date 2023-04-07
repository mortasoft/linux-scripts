import pandas as pd
import re

def transformar_telefono(row):

    val = str(row["Telefono"]).split("/")
    print(val)

    if len(str(row["Telefono"]).split("/")[0]) == 8:
        return row["Telefono"][:4] + "-" + row["Telefono"][4:8]

    if len(str(row["Telefono"])) == 17:
        return row["Telefono"][:4] + "-" + row["Telefono"][4:8]

    if len(str(row["Telefono"])) == 8:
        return row["Telefono"][:4] + "-" + row["Telefono"][4:]

    if len(str(row["Telefono"])) == 9 and "-" in str(row["Telefono"]):
        return row["Telefono"][:4] + "-" + row["Telefono"][5:] 

    if "Ext" in str(row["Telefono"]) or "EXT" in str(row["Telefono"]) or "ext" in str(row["Telefono"]):
        arr = row["Telefono"].split()
        row["Ext"] = arr[0]
        return formato_num(arr[0])


def transformar_ext(row):
    if "Ext" in str(row["Telefono"]) or "EXT" in str(row["Telefono"]) or "ext" in str(row["Telefono"]):
        arr = row["Telefono"].split()
        if len(arr) == 1:
            return re.findall(r'\d+', arr[0].split("ext")[1]) 
        if len(arr) == 2:
            return re.findall(r'\d+', arr[1])
        return arr[2]
        #if len(arr) == 3:
        #    return arr[2]


def formato_num(num):
    return num[:4]+ "-" + num[4:]

df = pd.read_csv(r"C:\Users\mandr\Documents\GitHub\pyfinance-manager\Consolidado.csv", encoding="utf-8")

df["Telefono"].astype(str)
df["Telefono_Arreglado"] = df.apply(transformar_telefono, axis=1)
df["Ext"] =                df.apply(transformar_ext, axis=1)
print(df.head())
print(df.query('Telefono == "22303078 / 114"'))

df.to_csv("res.csv", index=False)
