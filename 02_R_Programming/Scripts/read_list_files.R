read_dir_day <- function(directory, day){
        list <- data.frame()
        file_list <- list.files(directory, full.names = TRUE)
        for (i in 1:5){
                list <- rbind(list, read.csv(file_list[i]))
        }
        data_set <- list[which(list[,"Day"] == day),]
        median(data_set[,"Weight"], na.rm = TRUE)
}