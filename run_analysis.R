subjects1 = read.table('~/gcd project/train/subject_train.txt')
subjects2 = read.table('~/gcd project/test/subject_test.txt')
subjects = rbind(subjects1, subjects2)
write.table(subjects, file = '~/gcd project/subjects.txt', row.names = FALSE, col.names = FALSE)

X1 = read.table('~/gcd project/train/X_train.txt')
X2 = read.table('~/gcd project/test/X_test.txt')
X = rbind(X1, X2)
write.table(X, file = '~/gcd project/X.txt', row.names = FALSE, col.names = FALSE)

y1 = read.table('~/gcd project/train/y_train.txt')
y2 = read.table('~/gcd project/test/y_test.txt')
y = rbind(y1, y2)
write.table(y, file = '~/gcd project/y.txt', row.names = FALSE, col.names = FALSE)

Z = data.frame(X$V1, X$V2, X$V3, X$V4, X$V5, X$V6, X$V41, X$V42, X$V43, X$V44, X$V45, X$V46, X$V81, X$V82, X$V83, X$V84, X$V85, X$V86, X$V121, X$V122, X$V123, X$V124, X$V125, X$V126, X$V161, X$V162, X$V163, X$V164, X$V165, X$V166, X$V201, X$V202, X$V214, X$V215, X$V227, X$V228, X$V240, X$V241, X$V253, X$V254, X$V266, X$V267, X$V268, X$V269, X$V270, X$V271, X$V345, X$V346, X$V347, X$V348, X$V349, X$V350, X$V373, X$V374, X$V375, X$V424, X$V425, X$V426, X$V427, X$V428, X$V429, X$V503, X$V504, X$V516, X$V517, X$V529, X$V530, X$V542, X$V543)

activity = y
for (i in 1:10299) {
activity$V1[i] <- ifelse(y$V1[i] == 1, 'Walking',
ifelse(y$V1[i] == 2, 'WalkingUp',
ifelse(y$V1[i] == 3, 'WalkingDown',
ifelse(y$V1[i] == 4, 'Sitting',
ifelse(y$V1[i] == 5, 'Standing',
ifelse(y$V1[i] == 6, 'Laying',
))))))}

for (i in 1:10299) {
activity$index[i] = i
Z$index[i] = i
subjects$index[i] = i
}

K = merge(Z, activity, by = 'index')
Z = merge (K, subjects, by = 'index')
K = Z[, !(colnames(Z) %in% c('index'))]

write.table(K, file = '~/gcd project/K.txt', row.names = FALSE, col.names = FALSE)
K = read.table('~/gcd project/K.txt')

F = rename(K, c('V1' = 'tBodyAccMeanX', 'V2' = 'tBodyAccMeanY', 'V3' = 'tBodyAccMeanZ', 'V4' = 'tBodyAccStdX', 'V5' = 'tBodyAccStdY', 'V6' = 'tBodyAccStdZ', 'V7' = 'tGravityAccMeanX',  'V8' = 'tGravityAccMeanY', 'V9' = 'tGravityAccMeanZ', 'V10' = 'tGravityAccStdX', 'V11' = 'tGravityAccStdY', 'V12' = 'tGravityAccStdZ', 'V13' = 'tBodyAccJerkMeanX', 'V14' = 'tBodyAccJerkMeanY', 'V15' = 'tBodyAccJerkMeanZ', 'V16' = 'tBodyAccJerkStdX', 'V17' = 'tBodyAccJerkStdY', 'V18' = 'tBodyAccJerkStdZ', 'V19' = 'tBodyGyroMeanX',  'V20' = 'tBodyGyroMeanY', 'V21' = 'tBodyGyroMeanZ', 'V22' = 'tBodyGyroStdX', 'V23' = 'tBodyGyroStdY', 'V24' = 'tBodyGyroStdZ', 'V25' = 'tBodyGyroJerkMeanX', 'V26' = 'tBodyGyroJerkMeanY', 'V27' = 'tBodyGyroJerkMeanZ', 'V28' = 'tBodyGyroJerkStdX', 'V29' = 'tBodyGyroJerkStdY', 'V30' = 'tBodyGyroJerkStdZ', 'V31' = 'tBodyAccMagMean',  'V32' = 'tBodyAccMagStd', 'V33' = 'tGravityAccMagMean', 'V34' = 'tGravityAccMagStd', 'V35' = 'tBodyAccJerkMagMean', 'V36' = 'tBodyAccJerkMagStd', 'V37' = 'tBodyGyroMagMean', 'V38' = 'tBodyGeroMagStd', 'V39' = 'tBodyGyroJerkMagMean', 'V40' = 'tBodyGyroJerkMagStd', 'V41' = 'fBodyAccMeanX', 'V42' = 'fBodyAccMeanY', 'V43' = 'fBodyAccMeanZ',  'V44' = 'fBodyAccStdX', 'V45' = 'fBodyAccStdY', 'V46' = 'fBodyAccStdZ', 'V47' = 'fBodyAccJerkMeanX', 'V48' = 'fBodyAccJerkMeanY', 'V49' = 'fBodyAccJerkMeanZ', 'V50' = 'fBodyAccJerkStdX', 'V51' = 'fBodyAccJerkStdY', 'V52' = 'fBodyAccJerkStdZ', 'V53' = 'fBodyAccJerkMeanFreqX',  'V54' = 'fBodyAccJerkMeanFreqY', 'V55' = 'fBodyAccJerkMeanFreqZ', 'V56' = 'fBodyGyroMeanX', 'V57' = 'fBodyGyroMeanY', 'V58' = 'fBodyGyroMeanZ', 'V59' = 'fBodyGyroStdX', 'V60' = 'fBodyGyroStdY', 'V61' = 'fBodyGyroStdZ', 'V62' = 'fBodyAccMagMean', 'V63' = 'fBodyAccMagStd', 'V64' = 'fBodyAccJerkMagMean', 'V65' = 'fBodyAccJerkMagStd',  'V66' = 'fBodyBodyGyroMagMean', 'V67' = 'fBodyBodyGyroMagStd', 'V68' = 'fBodyBodyGyroJerkMagMean', 'V69' = 'fBodyGyroJerkMagStd', 'V70' = 'activityType', 'V71' = 'subject'))
write.table(F, file = '~/gcd project/Final.txt', row.names = FALSE)

K = aggregate(F[, 1:69], list(F$activityType, F$subject), mean)
Z = rename(K, c('Group.1' = 'activityType', 'Group.2' = 'subject'))
write.table(Z, file = '~/gcd project/FinalMean.txt', row.names=FALSE)