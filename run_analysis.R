

ActivityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
head(ActivityLabels)

Features<-read.table("UCI HAR Dataset/features.txt")
head(Features)

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

head(y_test,10)
dim(y_test)
dim(X_test)
dim(subject_test)
dim(Features)

Act_Sub_test<-cbind(y_test,subject_test)
dim(Act_Sub_test)
colnames(Act_Sub_test)<-c("Activity","Subject")


subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
dim(X_train)
dim(subject_train)
dim(ActivityLabels)

Act_Sub_train<-cbind(y_train,subject_train)
dim(Act_Sub_train)
names(Act_Sub_train)
colnames(Act_Sub_train)<-c("Activity","Subject")

z<-merge(Act_Sub_train,Act_Sub_test,all=TRUE)



Merged_train_Test<-merge(X_train,X_test,all=TRUE)
dim(Merged_train_Test)
colnames(Merged_train_Test)<-Features[,2]

matches <- grep(paste(c("mean\\(\\)", "std\\(\\)"),collapse="|"),names(Merged_train_Test), value=TRUE)
Required_Data<-Merged_train_Test[,matches]
names(Required_Data)


Complete_Data<-cbind(z,Required_Data)

dim(Complete_Data)
head(Complete_Data[,1:10],2)

View(Complete_Data[1:1000,])


g <- split(Complete_Data[,3:68], list(Complete_Data$Activity, Complete_Data$Subject))
Splitdata <- t(sapply(g, colMeans))


dim(Splitdata)
head(Splitdata[,1:10],2)

d1<-data.frame(Activity=rep(1:6,each=30),Subject=rep(1:30,6))
View(d1)
FinalData<-cbind(d1,Splitdata)
dim(FinalData)
View(FinalData)

row.names(FinalData)<-NULL


View(Q)
FinalData$Activity[FinalData$Activity==1] <- "WALKING"
FinalData$Activity[FinalData$Activity==2] <- "WALKING_UPSTAIRS"
FinalData$Activity[FinalData$Activity==3] <- "WALKING_DOWNSTAIRS"
FinalData$Activity[FinalData$Activity==4] <- "SITTING"
FinalData$Activity[FinalData$Activity==5] <- "STANDING"
FinalData$Activity[FinalData$Activity==6] <- "LAYING"

View(FinalData)

write.csv(FinalData,file="UCI HAR Dataset/FinalData.csv")
write.table(FinalData,file="UCI HAR Dataset/FinalData.txt")