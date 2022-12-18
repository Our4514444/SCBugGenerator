pragma solidity ^0.5.1;
contract Operations {
    function copyBytesNToBytes(bytes32 source, bytes memory destination, uint[1] memory pointer) internal pure {
        for (uint i=0; i < 32; i++) {
            if (source[i] == 0)
                break;
            else {
                destination[pointer[0]]=source[i];
                pointer[0]++;
            }
        }
    }
    function copyBytesToBytes(bytes memory source, bytes memory destination, uint[1] memory pointer) internal pure {
        for (uint i=0; i < source.length; i++) {
            if (source[i] == 0)
                break;
            destination[pointer[0]]=source[i];
            pointer[0]++;
        }
    }
    function uintToBytesN(uint v) internal pure returns (bytes32 ret) {
        if (v == 0) {
            ret = '0';
        }
        else {
            while (v > 0) {
//                ret = bytes32(uint(ret) / (2 ** 8));
//                ret |= bytes32(((v % 10) + 48) * 2 ** (8 * 31));
                ret = bytes32(uint(ret) >> 8);
                ret |= bytes32(((v % 10) + 48) << (8 * 31));
                v /= 10;
            }
        }
        return ret;
    }
    function stringToBytes32(string memory str) internal pure returns(bytes32) {
        bytes32 bStrN;
        assembly {
            bStrN := mload(add(str, 32))
        }
        return(bStrN);
    }
}

contract DataRegister is Operations {
    bytes32 Institute; 
    address owner;
    mapping(bytes10 => bytes) Instructor;
    mapping(uint => bytes10) InstructorUIds;
    uint internal InstructorCount = 0;
    struct course {
        bytes CourseName;
        bytes10 StartDate;
        bytes10 EndDate;
        uint Hours;
    }
    struct courseInstructor {
        uint CourseId;
        uint InstructorId;
    }
    courseInstructor[] CourseInstructor;
    mapping(bytes10 => course) Course;
    mapping(uint => bytes10) CourseUIds;
    uint CourseCount = 0;
    mapping(bytes10 => bytes) Student;
    mapping(uint => bytes10) StudentUIds;
    uint StudentCount = 0;
    struct certificate {
        uint CourseId;
        uint StudentId;
        uint CertificateType;
        bytes10 Result;
        bool Enabled;
    }
    mapping(bytes10 => certificate) Certificate;
    uint CertificateCount = 0;
    mapping(uint => bytes10) CertificateUIds;
    modifier onlyOwner() {
        require(msg.sender==owner);
        _;
    }
    modifier notEmpty(string memory str) {
        bytes memory bStr = bytes(str);
        require(bStr.length > 0);
        _;
    }
    modifier isPositive(uint number) {
        require(number > 0);
        _;
    }
    modifier haveInstructor(uint InstructorId) {
        require(Instructor[InstructorUIds[InstructorId]].length > 0);
        _;
    }
    modifier haveCourse(uint CourseId) {
        require(CourseUIds[CourseId].length > 0);
        _;
    }
    modifier haveStudent(uint StudentId) {
        require(Student[StudentUIds[StudentId]].length > 0);
        _;
    }
    modifier uniqueCertificateUId(string memory certificateUId) {
        require(Certificate[bytes10(stringToBytes32(certificateUId))].CourseId == 0);
        _;
    }
    modifier uniqueInstructorUId(string memory _instructorUId) {
        require(Instructor[bytes10(stringToBytes32(_instructorUId))].length == 0);
        _;
    }
    modifier uniqueCourseUId(string memory _courseUId) {
        require(Course[bytes10(stringToBytes32(_courseUId))].CourseName.length == 0);
        _;
    }
    modifier uniqueStudentUId(string memory _studentUId) {
        require(Student[bytes10(stringToBytes32(_studentUId))].length == 0);
        _;
    }
    modifier notRepeat(uint CourseId, uint InstructorId) {
        bool found = false;
        for (uint i = 0; i < CourseInstructor.length; i++) {
            if (CourseInstructor[i].CourseId == CourseId && CourseInstructor[i].InstructorId == InstructorId) {
                found = true;
                break;
            }
        }
        require(! found);
        _;
    }
    function RegisterInstructor(
        string memory NationalId, 
        string memory instructor
        ) public onlyOwner notEmpty(NationalId) notEmpty(instructor) uniqueInstructorUId(NationalId) returns(bool) {
            bytes10 _instructorUId = bytes10(stringToBytes32(NationalId));
            InstructorCount++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            Instructor[_instructorUId] = bytes(instructor);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            InstructorUIds[InstructorCount]=_instructorUId;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return(true);
    }
    function RegisterCourse(
        string memory CourseUId,
        string memory CourseName,
        string memory StartDate,
        string memory EndDate,
        uint Hours,
        uint InstructorId
        ) public onlyOwner notEmpty(CourseUId) notEmpty(CourseName) 
            isPositive(Hours) haveInstructor(InstructorId) uniqueCourseUId(CourseUId) {
            course memory _course = setCourseElements(CourseName, StartDate, EndDate, Hours);
            CourseCount++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            bytes10 _courseUId = bytes10(stringToBytes32(CourseUId));
            CourseUIds[CourseCount] = _courseUId;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            Course[_courseUId] = _course;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            courseInstructor memory _courseInstructor;
            _courseInstructor.CourseId = CourseCount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            _courseInstructor.InstructorId = InstructorId;
            CourseInstructor.push(_courseInstructor);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function AddCourseInstructor(
        uint CourseId,
        uint InstructorId
        ) public onlyOwner haveCourse(CourseId) notRepeat(CourseId, InstructorId) haveInstructor(InstructorId) {
            courseInstructor memory _courseInstructor;
            _courseInstructor.CourseId = CourseId;
            _courseInstructor.InstructorId = InstructorId;
            CourseInstructor.push(_courseInstructor);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    function setCourseElements(
        string memory CourseName, 
        string memory StartDate, 
        string memory EndDate,
        uint Hours
        ) internal pure returns(course memory) {
        course memory _course;
        _course.CourseName = bytes(CourseName);
        _course.StartDate = bytes10(stringToBytes32(StartDate));
        _course.EndDate = bytes10(stringToBytes32(EndDate));
        _course.Hours = Hours;
        return(_course);
    }
    function RegisterStudent(
        string memory NationalId,
        string memory Name
        ) public onlyOwner notEmpty(Name) notEmpty(NationalId) uniqueStudentUId(NationalId) returns(bool) {
            StudentCount++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            StudentUIds[StudentCount] = bytes10(stringToBytes32(NationalId));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            Student[StudentUIds[StudentCount]]=bytes(Name);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return(true);
    }
    function RegisterCertificate(
        string memory CertificateUId,
        uint CourseId,
        uint StudentId,
        uint CertificateType,
        string memory Result
        ) public onlyOwner haveStudent(StudentId) haveCourse(CourseId) 
        uniqueCertificateUId(CertificateUId) isPositive(CertificateType) returns(bool) {
            certificate memory _certificate;
            _certificate.CourseId = CourseId;
            _certificate.StudentId = StudentId;
            _certificate.CertificateType = CertificateType;
            _certificate.Result = bytes10(stringToBytes32(Result));
            _certificate.Enabled = true;
            bytes10 cert_uid = bytes10(stringToBytes32(CertificateUId));
            CertificateCount++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            Certificate[cert_uid] = _certificate;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            CertificateUIds[CertificateCount] = cert_uid;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return(true);
    }
    function EnableCertificate(string memory CertificateId) public onlyOwner notEmpty(CertificateId) returns(bool) {
        bytes10 _certificateId = bytes10(stringToBytes32(CertificateId));
        certificate memory _certificate = Certificate[_certificateId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_certificate.Result != '');
        require(! _certificate.Enabled);
        Certificate[_certificateId].Enabled = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return(true);
    }
    function DisableCertificate(string memory CertificateId) public onlyOwner notEmpty(CertificateId) returns(bool) {
        bytes10 _certificateId = bytes10(stringToBytes32(CertificateId));
        certificate memory _certificate = Certificate[_certificateId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_certificate.Result != '');
        require(_certificate.Enabled);
        Certificate[_certificateId].Enabled = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return(true);
    }
}

contract CryptoClassCertificate is DataRegister {
    constructor(string memory _Institute) public notEmpty(_Institute) {
        owner = msg.sender;
        Institute = stringToBytes32(_Institute);
    }
    function GetInstitute() public view returns(string  memory) {
        uint[1] memory pointer;
        pointer[0]=0;
        bytes memory institute=new bytes(48);
        copyBytesToBytes('{"Institute":"', institute, pointer);
        copyBytesNToBytes(Institute, institute, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesToBytes('"}', institute, pointer);
        return(string(institute));
    }
    function GetInstructors() public view onlyOwner returns(string memory) {
        uint len = 70;
        uint i;
        for (i=1 ; i <= InstructorCount ; i++) 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            len += 100 + Instructor[InstructorUIds[i]].length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory instructors = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        copyBytesNToBytes('{ "Instructors":[', instructors, pointer);
        for (i=1 ; i <= InstructorCount ; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (i > 1) 
                copyBytesNToBytes(',', instructors, pointer);
            copyBytesNToBytes('{"National Id":"', instructors, pointer);
            copyBytesNToBytes(InstructorUIds[i], instructors, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            copyBytesNToBytes('","Name":"', instructors, pointer);
            copyBytesToBytes(Instructor[InstructorUIds[i]], instructors, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            copyBytesNToBytes('"}', instructors, pointer);
        }
        copyBytesNToBytes(']}', instructors, pointer);
        return(string(instructors));
    }
    function GetInstructor(string memory InstructorNationalId) public view notEmpty(InstructorNationalId) returns(string memory) {
        bytes10 _instructorUId = bytes10(stringToBytes32(InstructorNationalId));
        require(Instructor[_instructorUId].length > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint len = 100 + Instructor[_instructorUId].length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory _instructor = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        copyBytesNToBytes('{ "Instructor":{"NationalId":"', _instructor, pointer);
        copyBytesNToBytes(_instructorUId, _instructor, pointer);
        copyBytesNToBytes('","Name":"', _instructor, pointer);
        copyBytesToBytes(Instructor[_instructorUId], _instructor, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('"}}', _instructor, pointer);
        return(string(_instructor));
    }
    function GetInstructorCourses(string memory InstructorNationalId) public view notEmpty(InstructorNationalId) returns(string memory) {
        bytes10 _instructorNationalId = bytes10(stringToBytes32(InstructorNationalId));
        require(Instructor[_instructorNationalId].length > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint _instructorId = 0;
        uint i;
        for (i = 1; i <= InstructorCount; i++)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (InstructorUIds[i] == _instructorNationalId) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                _instructorId = i;
                break;
            }
        uint len = 50;
        course memory _course;
        for (i=0; i< CourseInstructor.length; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (CourseInstructor[i].InstructorId == _instructorId) { 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                _course = Course[CourseUIds[CourseInstructor[i].CourseId]];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                len += 200 + Institute.length + _course.CourseName.length + Instructor[InstructorUIds[_instructorId]].length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            }
        }
        bytes memory courseInfo = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        copyBytesNToBytes('{"Courses":[', courseInfo, pointer);
        bool first = true;
        for (i=0; i< CourseInstructor.length; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (CourseInstructor[i].InstructorId == _instructorId) { 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                _course = Course[CourseUIds[CourseInstructor[i].CourseId]];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                if (first)
                    first = false;
                else
                    copyBytesNToBytes(',', courseInfo, pointer);
                copyBytesNToBytes('{"Course Id":"', courseInfo, pointer);
                copyBytesNToBytes(CourseUIds[CourseInstructor[i].CourseId], courseInfo, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                copyBytesNToBytes('","Course Name":"', courseInfo, pointer);
                copyBytesToBytes(_course.CourseName, courseInfo, pointer);
                copyBytesNToBytes('","Start Date":"', courseInfo, pointer);
                copyBytesNToBytes(_course.StartDate, courseInfo, pointer);
                copyBytesNToBytes('","End Date":"', courseInfo, pointer);
                copyBytesNToBytes(_course.EndDate, courseInfo, pointer);
                copyBytesNToBytes('","Duration":"', courseInfo, pointer);
                copyBytesNToBytes( uintToBytesN(_course.Hours), courseInfo, pointer);
                copyBytesNToBytes(' Hours"}', courseInfo, pointer);
            }
        }
        copyBytesNToBytes(']}', courseInfo, pointer);
        return(string(courseInfo));
    }
    function CourseIdByUId(bytes10 CourseUId) private view returns(uint CourseId) {
        CourseId = 0;
        for (uint i=1; i<=CourseCount;i++)
            if (CourseUIds[i] == CourseUId) {
                CourseId = i;
                break;
            }
        require(CourseId > 0);
    }
    function GetCourseInfo(string memory CourseUId) public view notEmpty(CourseUId) returns(string memory) {
        bytes10 _courseUId=bytes10(stringToBytes32(CourseUId));
        course memory _course;
        _course = Course[_courseUId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_course.CourseName.length > 0);
        uint len = 200;
        bytes memory instructorsList = CourseInstructorDescription(_courseUId);
        len += instructorsList.length + Institute.length + _course.CourseName.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory courseInfo = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        copyBytesNToBytes('{"Course":', courseInfo, pointer);
        copyBytesNToBytes('{"Issuer":"', courseInfo, pointer);
        copyBytesNToBytes(Institute, courseInfo, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('","Course Id":"', courseInfo, pointer);
        copyBytesNToBytes(_courseUId, courseInfo, pointer);
        copyBytesNToBytes('","Course Name":"', courseInfo, pointer);
        copyBytesToBytes(_course.CourseName, courseInfo, pointer);
        copyBytesNToBytes('",', courseInfo, pointer);
        copyBytesToBytes(instructorsList, courseInfo, pointer);
        copyBytesNToBytes(',"Start Date":"', courseInfo, pointer);
        copyBytesNToBytes(_course.StartDate, courseInfo, pointer);
        copyBytesNToBytes('","End Date":"', courseInfo, pointer);
        copyBytesNToBytes(_course.EndDate, courseInfo, pointer);
        copyBytesNToBytes('","Duration":"', courseInfo, pointer);
        copyBytesNToBytes( uintToBytesN(_course.Hours), courseInfo, pointer);
        copyBytesNToBytes(' Hours"}}', courseInfo, pointer);
        return(string(courseInfo));
    }
    function GetCourses() public view returns(string memory) {
        uint len = 50;
        uint i;
        course memory _course;
        for (i=1 ; i <= CourseCount ; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            _course = Course[CourseUIds[i]];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            len += 200 + _course.CourseName.length;
        }
        bytes memory courses = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        bytes32 hrs;
        copyBytesNToBytes('{"Courses":[', courses, pointer);
        for (i=1 ; i <= CourseCount ; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (i > 1)
                copyBytesNToBytes(',', courses, pointer);
            _course = Course[CourseUIds[i]];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            copyBytesNToBytes('{"Id":"', courses, pointer);
            copyBytesNToBytes(CourseUIds[i], courses, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            copyBytesNToBytes('","Name":"', courses, pointer);
            copyBytesToBytes(_course.CourseName, courses, pointer);
            copyBytesNToBytes('","Start Date":"', courses, pointer);
            copyBytesNToBytes(_course.StartDate, courses, pointer);
            copyBytesNToBytes('","End Date":"', courses, pointer);
            copyBytesNToBytes(_course.EndDate, courses, pointer);
            copyBytesNToBytes('","Duration":"', courses, pointer);
            hrs = uintToBytesN(_course.Hours);
            copyBytesNToBytes(hrs, courses, pointer);
            copyBytesNToBytes(' Hours"}', courses, pointer);
        }
        copyBytesNToBytes(']}', courses, pointer);
        return(string(courses));
    }
    function GetStudentInfo(string memory NationalId) public view notEmpty(NationalId) returns(string memory) {
        bytes10 _nationalId=bytes10(stringToBytes32(NationalId));
        bytes memory _student = Student[_nationalId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_student.length > 0);
        uint len = 150 + Institute.length + _student.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory studentInfo = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        copyBytesNToBytes('{"Student":', studentInfo, pointer);
        copyBytesNToBytes('{"Issuer":"', studentInfo, pointer);
        copyBytesNToBytes(Institute, studentInfo, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('","National Id":"', studentInfo, pointer);
        copyBytesNToBytes(_nationalId, studentInfo, pointer);
        copyBytesNToBytes('","Name":"', studentInfo, pointer);
        copyBytesToBytes(_student, studentInfo, pointer);
        copyBytesNToBytes('"}}', studentInfo, pointer);
        return(string(studentInfo));
    }
    function GetStudents() public view onlyOwner returns(string memory) {
        uint len = 50;
        uint i;
        for (i=1 ; i <= StudentCount ; i++) 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            len += 50 + Student[StudentUIds[i]].length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory students = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        copyBytesNToBytes('{"Students":[', students, pointer);
        for (i=1 ; i <= StudentCount ; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (i > 1)
                copyBytesNToBytes(',', students, pointer);
            bytes memory _student = Student[StudentUIds[i]];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            copyBytesNToBytes('{"National Id":"', students, pointer);
            copyBytesNToBytes(StudentUIds[i], students, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            copyBytesNToBytes('","Name":"', students, pointer);
            copyBytesToBytes(_student, students, pointer);
            copyBytesNToBytes('"}', students, pointer);
        }
        copyBytesNToBytes(']}', students, pointer);
        return(string(students));
    }
    function GetCertificates() public view onlyOwner returns(string memory) {
        uint len = 50;
        uint i;
        len += CertificateCount * 60;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory certificates = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        copyBytesNToBytes('{"Certificates":[', certificates, pointer);
        for (i = 1 ; i <= CertificateCount ; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (i > 1)
                copyBytesNToBytes(',', certificates, pointer);
            copyBytesNToBytes('{"Certificate Id":"', certificates, pointer);
            copyBytesNToBytes(CertificateUIds[i], certificates, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            copyBytesNToBytes('","Active":', certificates, pointer);
            if (Certificate[CertificateUIds[i]].Enabled)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                copyBytesNToBytes('true}', certificates, pointer);
            else
                copyBytesNToBytes('false}', certificates, pointer);
        }
        copyBytesNToBytes(']}', certificates, pointer);
        return(string(certificates));
    }
    function GetStudentCertificates(string memory NationalId) public view notEmpty(NationalId) returns(string memory) {
        uint len = 50;
        uint i;
        bytes10 _nationalId=bytes10(stringToBytes32(NationalId));
        require(Student[_nationalId].length > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        for (i = 1 ; i <= CertificateCount ; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (StudentUIds[Certificate[CertificateUIds[i]].StudentId] == _nationalId && 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                Certificate[CertificateUIds[i]].Enabled) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                len += 100 + Course[CourseUIds[Certificate[CertificateUIds[i]].CourseId]].CourseName.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            }
        }
        bytes memory certificates = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        copyBytesNToBytes('{"Certificates":[', certificates, pointer);
        bool first=true;
        for (i = 1 ; i <= CertificateCount ; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (StudentUIds[Certificate[CertificateUIds[i]].StudentId] == _nationalId && 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                Certificate[CertificateUIds[i]].Enabled) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                if (first)
                    first = false;
                else
                    copyBytesNToBytes(',', certificates, pointer);
                copyBytesNToBytes('{"Certificate Id":"', certificates, pointer);
                copyBytesNToBytes(CertificateUIds[i], certificates, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                copyBytesNToBytes('","Course Name":"', certificates, pointer);
                copyBytesToBytes(Course[CourseUIds[Certificate[CertificateUIds[i]].CourseId]].CourseName, certificates, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                copyBytesNToBytes('"}', certificates, pointer);
            }
        }
        copyBytesNToBytes(']}', certificates, pointer);
        return(string(certificates));
    }
    function GetCertificate(string memory CertificateId) public view notEmpty(CertificateId) returns(string memory) {
        bytes10 _certificateId = bytes10(stringToBytes32(CertificateId));
        require(Certificate[_certificateId].Enabled);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        certificate memory _certificate = Certificate[_certificateId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        course memory _course = Course[CourseUIds[_certificate.CourseId]];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory _student = Student[StudentUIds[_certificate.StudentId]];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory certSpec;
        bytes memory instructorsList = CourseInstructorDescription(CourseUIds[_certificate.CourseId]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint len = 500;
        len += _course.CourseName.length + instructorsList.length;
        uint[1] memory pointer;
        pointer[0] = 0;
        certSpec = new bytes(len);
        require(_certificate.StudentId > 0);
        require(_certificate.Enabled);
        copyBytesNToBytes('{"Certificate":{"Issuer":"', certSpec, pointer);
        copyBytesNToBytes(Institute, certSpec, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('","Certificate Id":"', certSpec, pointer);
        copyBytesNToBytes(_certificateId, certSpec, pointer);
        copyBytesNToBytes('","Name":"', certSpec, pointer);
        copyBytesToBytes(_student, certSpec, pointer);
        copyBytesNToBytes('","National Id":"', certSpec, pointer);
        copyBytesNToBytes( StudentUIds[_certificate.StudentId], certSpec, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('","Course Id":"', certSpec, pointer);
        copyBytesNToBytes(CourseUIds[_certificate.CourseId], certSpec, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('","Course Name":"', certSpec, pointer);
        copyBytesToBytes(_course.CourseName, certSpec, pointer);
        copyBytesNToBytes('","Start Date":"', certSpec, pointer);
        copyBytesNToBytes(_course.StartDate, certSpec, pointer);
        copyBytesNToBytes('","End Date":"', certSpec, pointer);
        copyBytesNToBytes(_course.EndDate, certSpec, pointer);
        copyBytesNToBytes('","Duration":"', certSpec, pointer);
        copyBytesNToBytes(uintToBytesN(_course.Hours), certSpec, pointer);
        copyBytesNToBytes(' Hours",', certSpec, pointer);
        copyBytesToBytes(instructorsList, certSpec, pointer);
        bytes10 _certType = CertificateTypeDescription(_certificate.CertificateType);
        copyBytesNToBytes(',"Course Type":"', certSpec, pointer);
        copyBytesNToBytes(_certType, certSpec, pointer);
        copyBytesNToBytes('","Result":"', certSpec, pointer);
        copyBytesNToBytes(_certificate.Result, certSpec, pointer);
        copyBytesNToBytes('"}}', certSpec, pointer);
        return(string(certSpec));
    }
    function CertificateTypeDescription(uint Type) pure internal returns(bytes10) {
        if (Type == 1) 
            return('Attendance');
        else if (Type == 2)
            return('Online');
        else if (Type == 3)
            return('Video');
        else if (Type == 4)
            return('ELearning');
        else
            return(bytes10(uintToBytesN(Type)));
    }
    function GetAdminStats() public view onlyOwner returns(string memory) {
        bytes memory stat;
        uint[1] memory pointer;
        pointer[0] = 0;
        stat = new bytes(400);
        copyBytesNToBytes('{"Instructors":', stat, pointer);
        copyBytesNToBytes(uintToBytesN(InstructorCount), stat, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes(',"Courses":', stat, pointer);
        copyBytesNToBytes(uintToBytesN(CourseCount), stat, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes(',"Students":', stat, pointer);
        copyBytesNToBytes(uintToBytesN(StudentCount), stat, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes(',"Certificates":', stat, pointer);
        copyBytesNToBytes(uintToBytesN(CertificateCount), stat, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('}', stat, pointer);
        return(string(stat));
    }
    function GetStats() public view returns(string memory) {
        bytes memory stat;
        uint[1] memory pointer;
        pointer[0] = 0;
        stat = new bytes(200);
        copyBytesNToBytes('{"Instructors":', stat, pointer);
        copyBytesNToBytes(uintToBytesN(InstructorCount), stat, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes(',"Courses":', stat, pointer);
        copyBytesNToBytes(uintToBytesN(CourseCount), stat, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('}', stat, pointer);
        return(string(stat));
    }
    function GetCourseStudents(string memory InstructorUId, string memory CourseUId) public view notEmpty(CourseUId) returns(string memory) {
        bytes10 _instructorUId = bytes10(stringToBytes32(InstructorUId));
        bytes10 _courseUId = bytes10(stringToBytes32(CourseUId));
        uint i;
        uint _instructorId = 0;

        for (i = 1;  i<= InstructorCount; i++)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (InstructorUIds[i] == _instructorUId) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                _instructorId = i;
                break;
            }
//        require(_instructorId != 0);
        uint _courseId = 0;

        for (i = 1;  i<= CourseCount; i++)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (CourseUIds[i] == _courseUId) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                _courseId = i;
                break;
            }

        require(_courseId != 0);
        bool found = false;
        for (i = 0; i < CourseInstructor.length; i++)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            if (CourseInstructor[i].InstructorId == _instructorId && CourseInstructor[i].CourseId == _courseId) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                found = true;
                break;
            }
        require(found || (msg.sender == owner));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        course memory _course = Course[_courseUId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bytes memory students;
        uint[1] memory pointer;
        pointer[0] = 0;
        bytes memory studentsList = CourseStudentDescription(_courseId);
        bytes memory instructorsList = CourseInstructorDescription(CourseUIds[_courseId]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint len = 150 + studentsList.length + instructorsList.length + Institute.length + _course.CourseName.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        students = new bytes(len);
        copyBytesNToBytes('{"Course":{"Issuer":"', students, pointer);
        copyBytesNToBytes(Institute, students, pointer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        copyBytesNToBytes('","Course Id":"', students, pointer);
        copyBytesNToBytes(_courseUId, students, pointer);
        copyBytesNToBytes('","Course Name":"', students, pointer);
        copyBytesToBytes(_course.CourseName, students, pointer);
        copyBytesNToBytes('",', students, pointer);
        copyBytesToBytes(instructorsList, students, pointer);
        copyBytesNToBytes(',"Start Date":"', students, pointer);
        copyBytesNToBytes(_course.StartDate, students, pointer);
        copyBytesNToBytes('","End Date":"', students, pointer);
        copyBytesNToBytes(_course.EndDate, students, pointer);
        copyBytesNToBytes('","Duration":"', students, pointer);
        copyBytesNToBytes( uintToBytesN(_course.Hours), students, pointer);
        copyBytesNToBytes(' Hours",', students, pointer);
        copyBytesToBytes(studentsList, students, pointer);
        copyBytesNToBytes('}}', students, pointer);
        return(string(students));
    }
    function CourseStudentDescription(uint CourseId) internal view returns(bytes memory) {
        bytes memory students;
        uint[1] memory pointer;
        pointer[0] = 0;
        uint i;
        bytes10 _studentId;
        uint len = 20;
        for (i = 1; i <= CertificateCount; i++)
            if (Certificate[CertificateUIds[i]].CourseId == CourseId) {
                _studentId = StudentUIds[Certificate[CertificateUIds[i]].StudentId];
                len += 60 + Student[_studentId].length;
            }
        students = new bytes(len);
        copyBytesNToBytes('"Students":[', students, pointer);
        bool first = true;
        for (i = 1; i <= CertificateCount; i++) {
            if (Certificate[CertificateUIds[i]].CourseId == CourseId) {
                if (first)
                    first = false;
                else
                    copyBytesNToBytes(',', students, pointer);
                _studentId = StudentUIds[Certificate[CertificateUIds[i]].StudentId];
                copyBytesNToBytes('{"National Id":"', students, pointer);
                copyBytesNToBytes(_studentId, students, pointer);
                copyBytesNToBytes('","Name":"', students, pointer);
                copyBytesToBytes(Student[_studentId], students, pointer);
                copyBytesNToBytes('"}', students, pointer);
            }
        }
        copyBytesNToBytes(']', students, pointer);
        return(students);
   }
   function CourseInstructorDescription(bytes10 CourseUId) internal view returns(bytes memory) {
        bytes memory instructors;
        uint[1] memory pointer;
        uint len=100;
        uint i;
        uint courseInstructorCount = 0;
        for (i=0; i< CourseInstructor.length; i++)
            if (CourseUIds[CourseInstructor[i].CourseId] == CourseUId)
                courseInstructorCount++;
        uint[] memory courseInstructors = new uint[](courseInstructorCount); 
        courseInstructorCount = 0;
        for (i=0; i< CourseInstructor.length; i++)
            if (CourseUIds[CourseInstructor[i].CourseId] == CourseUId) {
                courseInstructors[courseInstructorCount] = CourseInstructor[i].InstructorId;
                courseInstructorCount++;
                len += Instructor[InstructorUIds[CourseInstructor[i].InstructorId]].length + 20;
            }
        instructors = new bytes(len);
        if (courseInstructorCount == 1) {
            copyBytesNToBytes('"Instructor":"', instructors, pointer);
            copyBytesToBytes(Instructor[InstructorUIds[courseInstructors[0]]], instructors, pointer);
            copyBytesNToBytes('"', instructors, pointer);
        }
        else {
            copyBytesNToBytes('"Instructors":[', instructors, pointer);
            for (i=0; i<courseInstructorCount; i++){
                if (i > 0)
                    copyBytesNToBytes(',', instructors, pointer);
                copyBytesNToBytes('"', instructors, pointer);
                copyBytesToBytes(Instructor[InstructorUIds[courseInstructors[i]]], instructors, pointer);
                copyBytesNToBytes('"', instructors, pointer);
            }
            copyBytesNToBytes(']', instructors, pointer);
        }
        return(instructors);
   }
}