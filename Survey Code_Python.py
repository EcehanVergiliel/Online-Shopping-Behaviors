import pandas as pd
import numpy as np
import scipy.stats
from scipy.stats import chi2
import seaborn as sns
import folium 
data=pd.read_csv("C:\\Users\\ASUS\\Desktop\\Survey Responses2.csv.xls",encoding="latin1")



data.rename(columns={"Birth place":"city"},inplace=True)



tr=pd.read_csv("C:\\Users\\ASUS\\Desktop\\worldcities.csv")
tr=tr[tr["country"]=="Turkey"]
tr=tr[["city","lat","lng"]]



data.replace("Istanbul","İstanbul",inplace=True)
data.replace('Izmir', 'İzmir',inplace=True)
data.replace('Eskisehir', 'Eskişehir',inplace=True)
data.replace('Eskisehir ', 'Eskişehir',inplace=True)
data.replace('Mugla', 'Muğla',inplace=True)
data.replace('Izmir ', 'İzmir',inplace=True)
data.replace("Istanbul ","İstanbul",inplace=True)
data.replace("Corum","Çorum",inplace=True)
data.replace("Ankara ","Ankara",inplace=True)
data.replace('Gaziantep ', 'Gaziantep',inplace=True)
data.replace('Tekirdag', 'Tekirdağ',inplace=True)
data.replace('Kocaeli ', 'Kocaeli',inplace=True)
data.replace('Yozgat ', 'Yozgat',inplace=True)
data.replace('Kutahya', 'Kütahya',inplace=True)
data.replace('Usak', 'Uşak',inplace=True)
data.replace('Antalya ', 'Antalya',inplace=True)
data.replace('Karaman ', 'Karaman',inplace=True)
data.replace('Aydin', 'Aydın',inplace=True)
data.replace('Çankiri', 'Çankırı',inplace=True)
data.replace('Bingol', 'Bingöl',inplace=True)
data.replace('Adana ', 'Adana',inplace=True)
data.replace('Nigde', 'Niğde',inplace=True)
data.replace('Kahramanmaras', 'Kahramanmaraş',inplace=True)
data.replace('Erzurum ', 'Erzurum',inplace=True)
data.replace('Malatya ', 'Malatya',inplace=True)
data.replace('Alanya', 'Antalya',inplace=True)
data.replace('Bandırma', 'Balıkesir',inplace=True)
data.replace('Azerbaijan', 'Baku',inplace=True)
data.replace('Cankırı', 'Çankırı',inplace=True)

data.replace('Germany', 'Berlin',inplace=True)
data.replace('Cyprus', 'Latsia',inplace=True)
data.replace('Tanzania', 'Dodoma',inplace=True)
data.replace('Australia', 'Canberra',inplace=True)
data.replace('Pakistan ', 'Islamabad',inplace=True)
data.replace('Astana', 'Nur-Sultan',inplace=True)
data.replace('Bandırma', 'Balıkesir',inplace=True)
data.replace('İstanbul', 'Istanbul',inplace=True)
data.replace('Bal?kesir', 'Balıkesir',inplace=True)
data.replace('Diyarbak?r', 'Diyarbakır',inplace=True)
data.replace('Ad?yaman', 'Adıyaman',inplace=True)
data.replace('Cank?r?', 'Çankırı',inplace=True)
data.replace('Çankırı', 'Çankırı',inplace=True)
data.replace('Kazakhstan', 'Nur-Sultan',inplace=True)
data.replace('Pakistan', 'Islamabad',inplace=True)



data=pd.DataFrame(data['city'].value_counts())
data["number"]=data.city
data["city"]=data.index
data=data.reset_index()
data=data.drop("index",axis=1)


for index,row in data["city"].iteritems():
    if row in tr["city"].tolist():
        pass
    else:
        print(row + " not exist")


turkey = tr.merge(data,on="city")



m = folium.Map(location=[39.7,34.7], control_scale=True, 
                tiles='cartodbpositron', zoom_start=6,attr = "text some")



for i in range(0,len(turkey)):
   folium.Circle(
      location=[turkey.iloc[i]['lat'], turkey.iloc[i]['lng']],
      popup=turkey.iloc[i]['city'],
      radius=float(turkey.iloc[i]['number'])*1000,
      color='crimson',
      fill=True,
      fill_color='red'
   ).add_to(m)	
m



data=pd.read_csv("C:\\Users\\ASUS\\Desktop\\Survey Responses2.csv.xls",encoding="latin1")
data["m_p_c"]=data['Mostly prefered'].value_counts()



data2=data[["Collecting info","Mostly prefered"]].dropna()
data1=data2["Mostly prefered"].tolist()
for i in range(len(data1)):
    data1[i]=data1[i].strip(" ").split(",")
data2["Mostly prefered"]=data1
data2.reset_index(inplace=True)
data2.loc[i,"Collecting info"]



liste=["Electronic_products","Cosmetic_products","Clothing","Shoes & Bags","Sport","Outdoor","Baby care","Accessory","Building Supply","Book & Stationery","Hobby","Furniture"]
Electronic_products=[0]*len(data2)
Cosmetic_products=[0]*len(data2)
Clothing=[0]*len(data2)
Shoes_Bags=[0]*len(data2)
Sport=[0]*len(data2)
Outdoor=[0]*len(data2)
Baby_care=[0]*len(data2)
Accessory=[0]*len(data2)
Building_supply=[0]*len(data2)
Book_Stationery=[0]*len(data2)
Hobby=[0]*len(data2)
Furniture=[0]*len(data2)
d=pd.DataFrame(columns=["İndex","Mostly prefered","Collecting info"])



for i in range(len(data2)):
    if "Electronic Products"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Electronic Products",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Clothing"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Clothing",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Accessory"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Accessory",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Shoes & Bags"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Shoes & Bags",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Sport"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Sport",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Outdoor"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Outdoor",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Baby care"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Baby care",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Building Supply"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Building Supply",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Book & Stationery"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Book & Stationery",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Hobby"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Hobby",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Furniture"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Furniture",data2.loc[i,"Collecting info"]]
    else:
        pass
for i in range(len(data2)):
    if "Cosmetic Products"  in data2.loc[i,"Mostly prefered"]:
        d.loc[len(d.index)]=[i,"Cosmetic Products",data2.loc[i,"Collecting info"]]
    else:
        pass



    cttable=pd.crosstab(d["Collecting info"],d["Mostly prefered"])
# Import seaborn library
import seaborn as sns
 
# Declaring the cm variable by the
# color palette from seaborn
cm = sns.light_palette("green", as_cmap=True)




chi2_stat, p, dof, expected = scipy.stats.chi2_contingency(cttable)



cttable



cttable.to_excel("C:\\Users\\ASUS\\Desktop\\cstable.xlsx")

