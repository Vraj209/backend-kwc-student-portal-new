-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('Male', 'Female');

-- CreateEnum
CREATE TYPE "StatusType" AS ENUM ('Student_Visa', 'Work_Permit', 'Permanent_Resident', 'Citizen');

-- CreateEnum
CREATE TYPE "SkillsType" AS ENUM ('Dance', 'Singing', 'Acting', 'Speech', 'Decoration', 'Maintainance', 'Management', 'Cooking');

-- CreateEnum
CREATE TYPE "SevaType" AS ENUM ('None', 'Mandir_Pujari', 'Mandir_Maintenance', 'Mandir_Kitchen', 'Mandir_Sabha_Vayvstha', 'Mandir_Gujarati_Teacher', 'Mandir_Audio_Video', 'Mandir_Setup_Windup_Kitchen', 'Mandir_Shayona', 'Mandir_Decoration', 'Mandir_Book_Store', 'Student_Volunteer_Coordinator', 'Student_Outbound_Activity', 'Student_Kitchen', 'Student_Flyer_Design', 'Student_Audio_Video_Photography', 'Student_Accommodation', 'Student_Decoration', 'Student_PR', 'Student_Network_Admin', 'Student_Database_Admin', 'Student_Sampark_Karyakar', 'Student_Ride');

-- CreateEnum
CREATE TYPE "ApplicationStatus" AS ENUM ('Pending', 'Approved', 'Rejected');

-- CreateTable
CREATE TABLE "Student" (
    "studentId" SERIAL NOT NULL,
    "studentImage" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "dateOfBirth" TIMESTAMP(3) NOT NULL,
    "gender" "Gender" NOT NULL,
    "phoneNumber" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "status" "StatusType" NOT NULL,
    "skill" "SkillsType" NOT NULL,
    "applicationStatus" "ApplicationStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("studentId")
);

-- CreateTable
CREATE TABLE "IndiaDetails" (
    "indiaDetailsId" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "studentId" INTEGER NOT NULL,

    CONSTRAINT "IndiaDetails_pkey" PRIMARY KEY ("indiaDetailsId")
);

-- CreateTable
CREATE TABLE "MandirData" (
    "mandirDataId" SERIAL NOT NULL,
    "primarySeva" "SevaType" NOT NULL DEFAULT 'None',
    "secondarySeva" "SevaType" NOT NULL DEFAULT 'None',
    "satsangi" BOOLEAN NOT NULL DEFAULT false,
    "MIS" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "studentId" INTEGER NOT NULL,

    CONSTRAINT "MandirData_pkey" PRIMARY KEY ("mandirDataId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Student_phoneNumber_key" ON "Student"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Student_email_key" ON "Student"("email");

-- CreateIndex
CREATE UNIQUE INDEX "IndiaDetails_studentId_key" ON "IndiaDetails"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "MandirData_studentId_key" ON "MandirData"("studentId");

-- AddForeignKey
ALTER TABLE "IndiaDetails" ADD CONSTRAINT "IndiaDetails_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("studentId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MandirData" ADD CONSTRAINT "MandirData_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("studentId") ON DELETE RESTRICT ON UPDATE CASCADE;
