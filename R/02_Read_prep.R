# R/02_Read_prep.R


# 01) Read in data --------------------------------------------------------
# read in data
gcbs <- read_csv("data/gcbs_clean_data.csv")
gcbs$ID <- NULL # drop ID column

# read in item names
gcbs_names <- read_csv('data/shane/gcbs_names.csv')
gcbs_items <- as.vector(gcbs_names$Q_label)
gcbs_items <- gsub("(.{35,}?)\\s", "\\1\n", gcbs_items)  # place break every 35 characters to nearest white space


# 02) Create groups list for GCBS -----------------------------------------
# Listed according to reported factor 
gcbsGroups <- list()
gcbsGroups$`Government malfeasance` <- c(1, 6, 11)
gcbsGroups$`Extraterrestrial cover-up` <- c(3, 8, 13)
gcbsGroups$`Malevolent global` <- c(2, 7, 12)
gcbsGroups$`Personal wellbeing` <- c(4, 9, 14)
gcbsGroups$`Control of information` <- c(5, 10, 15)


# 03) Create ordered dataframe for circular layout ------------------------
# new dataframe, ordered by group
gcbs_2 <- gcbs[, c(1, 6, 11, 3, 8, 13, 2, 7, 12, 4, 9, 14, 5, 10, 15)]

gcbsGroups2 <- list()
gcbsGroups2$`Government malfeasance` <- c(1:3)
gcbsGroups2$`Extraterrestrial cover-up` <- c(4:6)
gcbsGroups2$`Malevolent global` <- c(7:9)
gcbsGroups2$`Personal wellbeing` <- c(10:12)
gcbsGroups2$`Control of information` <- c(13:15)
