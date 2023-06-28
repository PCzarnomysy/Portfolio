dane <- readxl::read_excel("EN_średnia_wieku.xlsx")

library(ggplot2)

ggplot(data=dane)+
  geom_smooth(mapping=aes(x=śr_wiek_11, y=pkt), colour="red") + 
  labs(title="Średni wiek a punkty drużyny", x="Średni wiek", y="Liczba punktów")


ggplot(data=dane)+
  geom_smooth(mapping=aes(x=śr_wiek_11, y=pozycja), colour="red") + 
  labs(title="Średni wiek a pozycja drużyny", x="Średni wiek", y="Liczba punktów") +
  scale_y_reverse()


ggplot(data=dane)+
  geom_smooth(mapping=aes(x=śr_wiek_11, y=stracone, colour="Gole stracone wąska kadra")) +
  geom_smooth(mapping=aes(x=śr_wiek_kadra_mecz, y=stracone, colour="Gole stracone szeroka kadra")) +
  labs(title="Średni wiek a liczba straconych bramek", x="Średni wiek", y="Bramki") +
  scale_colour_manual("", 
                      breaks = c("Gole stracone szeroka kadra", "Gole stracone wąska kadra"),
                      values = c("darkgreen", "red"))

ggplot(data=dane)+
  geom_smooth(mapping=aes(x=śr_wiek_11, y=strzelone, colour="Gole strzelone")) +
  geom_smooth(mapping=aes(x=śr_wiek_11, y=stracone, colour="Gole stracone")) +
  labs(title="Średni wiek a liczba bramek drużyny", x="Średni wiek", y="Bramki") +
  scale_colour_manual("", 
                          breaks = c("Gole strzelone", "Gole stracone"),
                          values = c("darkgreen", "red"))

ggplot(data=dane)+
  geom_smooth(mapping=aes(x=śr_wiek_11, y=strzelone, colour="Gole strzelone wąska kadra")) +
  geom_smooth(mapping=aes(x=śr_wiek_kadra_mecz, y=strzelone, colour="Gole strzelone szeroka kadra")) +
  labs(title="Średni wiek a liczba strzelonych bramek", x="Średni wiek", y="Bramki") +
  scale_colour_manual("", 
                      breaks = c("Gole strzelone szeroka kadra", "Gole strzelone wąska kadra"),
                      values = c("darkgreen", "red"))
