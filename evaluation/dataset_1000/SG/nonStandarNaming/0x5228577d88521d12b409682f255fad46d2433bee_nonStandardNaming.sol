pragma solidity ^0.5.1;
contract Operations {
    function COPYBYTESNTOBYTES124(bytes32 source, bytes memory destination, uint[1] memory pointer) internal pure {	//inject NONSTANDARD NAMING
        for (uint i=0; i < 32; i++) {
            if (source[i] == 0)
                break;
            else {
                destination[pointer[0]]=source[i];
                pointer[0]++;
            }
        }
    }
    function COPYBYTESTOBYTES381(bytes memory source, bytes memory destination, uint[1] memory pointer) internal pure {	//inject NONSTANDARD NAMING
        for (uint i=0; i < source.length; i++) {
            if (source[i] == 0)
                break;
            destination[pointer[0]]=source[i];
            pointer[0]++;
        }
    }
    function UINTTOBYTESN509(uint v) internal pure returns (bytes32 ret) {	//inject NONSTANDARD NAMING
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
    function STRINGTOBYTES32252(string memory str) internal pure returns(bytes32) {	//inject NONSTANDARD NAMING
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
    uint public InstructorCount = 0;
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
    modifier ONLYOWNER575() {	//inject NONSTANDARD NAMING
        require(msg.sender==owner);
        _;
    }
    modifier NOTEMPTY511(string memory str) {	//inject NONSTANDARD NAMING
        bytes memory bStr = bytes(str);
        require(bStr.length > 0);
        _;
    }
    modifier ISPOSITIVE673(uint number) {	//inject NONSTANDARD NAMING
        require(number > 0);
        _;
    }
    modifier HAVEINSTRUCTOR727(uint InstructorId) {	//inject NONSTANDARD NAMING
        require(Instructor[InstructorUIds[InstructorId]].length > 0);
        _;
    }
    modifier HAVECOURSE436(uint CourseId) {	//inject NONSTANDARD NAMING
        require(CourseUIds[CourseId].length > 0);
        _;
    }
    modifier HAVESTUDENT83(uint StudentId) {	//inject NONSTANDARD NAMING
        require(Student[StudentUIds[StudentId]].length > 0);
        _;
    }
    modifier UNIQUECERTIFICATEUID300(string memory certificateUId) {	//inject NONSTANDARD NAMING
        require(Certificate[bytes10(STRINGTOBYTES32252(certificateUId))].CourseId == 0);
        _;
    }
    modifier UNIQUEINSTRUCTORUID627(string memory _instructorUId) {	//inject NONSTANDARD NAMING
        require(Instructor[bytes10(STRINGTOBYTES32252(_instructorUId))].length == 0);
        _;
    }
    modifier UNIQUECOURSEUID845(string memory _courseUId) {	//inject NONSTANDARD NAMING
        require(Course[bytes10(STRINGTOBYTES32252(_courseUId))].CourseName.length == 0);
        _;
    }
    modifier UNIQUESTUDENTUID569(string memory _studentUId) {	//inject NONSTANDARD NAMING
        require(Student[bytes10(STRINGTOBYTES32252(_studentUId))].length == 0);
        _;
    }
    modifier NOTREPEAT596(uint CourseId, uint InstructorId) {	//inject NONSTANDARD NAMING
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
    function REGISTERINSTRUCTOR422(	//inject NONSTANDARD NAMING
        string memory NationalId, 
        string memory instructor
        ) public ONLYOWNER575 NOTEMPTY511(NationalId) NOTEMPTY511(instructor) UNIQUEINSTRUCTORUID627(NationalId) returns(bool) {
            bytes10 _instructorUId = bytes10(STRINGTOBYTES32252(NationalId));
            InstructorCount++;
            Instructor[_instructorUId] = bytes(instructor);
            InstructorUIds[InstructorCount]=_instructorUId;
            return(true);
    }
    function REGISTERCOURSE397(	//inject NONSTANDARD NAMING
        string memory CourseUId,
        string memory CourseName,
        string memory StartDate,
        string memory EndDate,
        uint Hours,
        uint InstructorId
        ) public ONLYOWNER575 NOTEMPTY511(CourseUId) NOTEMPTY511(CourseName) 
            ISPOSITIVE673(Hours) HAVEINSTRUCTOR727(InstructorId) UNIQUECOURSEUID845(CourseUId) {
            course memory _course = SETCOURSEELEMENTS277(CourseName, StartDate, EndDate, Hours);
            CourseCount++;
            bytes10 _courseUId = bytes10(STRINGTOBYTES32252(CourseUId));
            CourseUIds[CourseCount] = _courseUId;
            Course[_courseUId] = _course;
            courseInstructor memory _courseInstructor;
            _courseInstructor.CourseId = CourseCount;
            _courseInstructor.InstructorId = InstructorId;
            CourseInstructor.push(_courseInstructor);
    }
    function ADDCOURSEINSTRUCTOR774(	//inject NONSTANDARD NAMING
        uint CourseId,
        uint InstructorId
        ) public ONLYOWNER575 HAVECOURSE436(CourseId) NOTREPEAT596(CourseId, InstructorId) HAVEINSTRUCTOR727(InstructorId) {
            courseInstructor memory _courseInstructor;
            _courseInstructor.CourseId = CourseId;
            _courseInstructor.InstructorId = InstructorId;
            CourseInstructor.push(_courseInstructor);
        }
    function SETCOURSEELEMENTS277(	//inject NONSTANDARD NAMING
        string memory CourseName, 
        string memory StartDate, 
        string memory EndDate,
        uint Hours
        ) internal pure returns(course memory) {
        course memory _course;
        _course.CourseName = bytes(CourseName);
        _course.StartDate = bytes10(STRINGTOBYTES32252(StartDate));
        _course.EndDate = bytes10(STRINGTOBYTES32252(EndDate));
        _course.Hours = Hours;
        return(_course);
    }
    function REGISTERSTUDENT831(	//inject NONSTANDARD NAMING
        string memory NationalId,
        string memory Name
        ) public ONLYOWNER575 NOTEMPTY511(Name) NOTEMPTY511(NationalId) UNIQUESTUDENTUID569(NationalId) returns(bool) {
            StudentCount++;
            StudentUIds[StudentCount] = bytes10(STRINGTOBYTES32252(NationalId));
            Student[StudentUIds[StudentCount]]=bytes(Name);
        return(true);
    }
    function REGISTERCERTIFICATE709(	//inject NONSTANDARD NAMING
        string memory CertificateUId,
        uint CourseId,
        uint StudentId,
        uint CertificateType,
        string memory Result
        ) public ONLYOWNER575 HAVESTUDENT83(StudentId) HAVECOURSE436(CourseId) 
        UNIQUECERTIFICATEUID300(CertificateUId) ISPOSITIVE673(CertificateType) returns(bool) {
            certificate memory _certificate;
            _certificate.CourseId = CourseId;
            _certificate.StudentId = StudentId;
            _certificate.CertificateType = CertificateType;
            _certificate.Result = bytes10(STRINGTOBYTES32252(Result));
            _certificate.Enabled = true;
            bytes10 cert_uid = bytes10(STRINGTOBYTES32252(CertificateUId));
            CertificateCount++;
            Certificate[cert_uid] = _certificate;
            CertificateUIds[CertificateCount] = cert_uid;
            return(true);
    }
    function ENABLECERTIFICATE849(string memory CertificateId) public ONLYOWNER575 NOTEMPTY511(CertificateId) returns(bool) {	//inject NONSTANDARD NAMING
        bytes10 _certificateId = bytes10(STRINGTOBYTES32252(CertificateId));
        certificate memory _certificate = Certificate[_certificateId];
        require(_certificate.Result != '');
        require(! _certificate.Enabled);
        Certificate[_certificateId].Enabled = true;
        return(true);
    }
    function DISABLECERTIFICATE116(string memory CertificateId) public ONLYOWNER575 NOTEMPTY511(CertificateId) returns(bool) {	//inject NONSTANDARD NAMING
        bytes10 _certificateId = bytes10(STRINGTOBYTES32252(CertificateId));
        certificate memory _certificate = Certificate[_certificateId];
        require(_certificate.Result != '');
        require(_certificate.Enabled);
        Certificate[_certificateId].Enabled = false;
        return(true);
    }
}

contract CryptoClassCertificate is DataRegister {
    constructor(string memory _Institute) public NOTEMPTY511(_Institute) {
        owner = msg.sender;
        Institute = STRINGTOBYTES32252(_Institute);
    }
    function GETINSTITUTE363() public view returns(string  memory) {	//inject NONSTANDARD NAMING
        uint[1] memory pointer;
        pointer[0]=0;
        bytes memory institute=new bytes(48);
        COPYBYTESTOBYTES381('{"Institute":"', institute, pointer);
        COPYBYTESNTOBYTES124(Institute, institute, pointer);
        COPYBYTESTOBYTES381('"}', institute, pointer);
        return(string(institute));
    }
    function GETINSTRUCTORS462() public view ONLYOWNER575 returns(string memory) {	//inject NONSTANDARD NAMING
        uint len = 70;
        uint i;
        for (i=1 ; i <= InstructorCount ; i++) 
            len += 100 + Instructor[InstructorUIds[i]].length;
        bytes memory instructors = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        COPYBYTESNTOBYTES124('{ "Instructors":[', instructors, pointer);
        for (i=1 ; i <= InstructorCount ; i++) {
            if (i > 1) 
                COPYBYTESNTOBYTES124(',', instructors, pointer);
            COPYBYTESNTOBYTES124('{"National Id":"', instructors, pointer);
            COPYBYTESNTOBYTES124(InstructorUIds[i], instructors, pointer);
            COPYBYTESNTOBYTES124('","Name":"', instructors, pointer);
            COPYBYTESTOBYTES381(Instructor[InstructorUIds[i]], instructors, pointer);
            COPYBYTESNTOBYTES124('"}', instructors, pointer);
        }
        COPYBYTESNTOBYTES124(']}', instructors, pointer);
        return(string(instructors));
    }
    function GETINSTRUCTOR979(string memory InstructorNationalId) public view NOTEMPTY511(InstructorNationalId) returns(string memory) {	//inject NONSTANDARD NAMING
        bytes10 _instructorUId = bytes10(STRINGTOBYTES32252(InstructorNationalId));
        require(Instructor[_instructorUId].length > 0);
        uint len = 100 + Instructor[_instructorUId].length;
        bytes memory _instructor = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        COPYBYTESNTOBYTES124('{ "Instructor":{"NationalId":"', _instructor, pointer);
        COPYBYTESNTOBYTES124(_instructorUId, _instructor, pointer);
        COPYBYTESNTOBYTES124('","Name":"', _instructor, pointer);
        COPYBYTESTOBYTES381(Instructor[_instructorUId], _instructor, pointer);
        COPYBYTESNTOBYTES124('"}}', _instructor, pointer);
        return(string(_instructor));
    }
    function GETINSTRUCTORCOURSES778(string memory InstructorNationalId) public view NOTEMPTY511(InstructorNationalId) returns(string memory) {	//inject NONSTANDARD NAMING
        bytes10 _instructorNationalId = bytes10(STRINGTOBYTES32252(InstructorNationalId));
        require(Instructor[_instructorNationalId].length > 0);
        uint _instructorId = 0;
        uint i;
        for (i = 1; i <= InstructorCount; i++)
            if (InstructorUIds[i] == _instructorNationalId) {
                _instructorId = i;
                break;
            }
        uint len = 50;
        course memory _course;
        for (i=0; i< CourseInstructor.length; i++) {
            if (CourseInstructor[i].InstructorId == _instructorId) { 
                _course = Course[CourseUIds[CourseInstructor[i].CourseId]];
                len += 200 + Institute.length + _course.CourseName.length + Instructor[InstructorUIds[_instructorId]].length;
            }
        }
        bytes memory courseInfo = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        COPYBYTESNTOBYTES124('{"Courses":[', courseInfo, pointer);
        bool first = true;
        for (i=0; i< CourseInstructor.length; i++) {
            if (CourseInstructor[i].InstructorId == _instructorId) { 
                _course = Course[CourseUIds[CourseInstructor[i].CourseId]];
                if (first)
                    first = false;
                else
                    COPYBYTESNTOBYTES124(',', courseInfo, pointer);
                COPYBYTESNTOBYTES124('{"Course Id":"', courseInfo, pointer);
                COPYBYTESNTOBYTES124(CourseUIds[CourseInstructor[i].CourseId], courseInfo, pointer);
                COPYBYTESNTOBYTES124('","Course Name":"', courseInfo, pointer);
                COPYBYTESTOBYTES381(_course.CourseName, courseInfo, pointer);
                COPYBYTESNTOBYTES124('","Start Date":"', courseInfo, pointer);
                COPYBYTESNTOBYTES124(_course.StartDate, courseInfo, pointer);
                COPYBYTESNTOBYTES124('","End Date":"', courseInfo, pointer);
                COPYBYTESNTOBYTES124(_course.EndDate, courseInfo, pointer);
                COPYBYTESNTOBYTES124('","Duration":"', courseInfo, pointer);
                COPYBYTESNTOBYTES124( UINTTOBYTESN509(_course.Hours), courseInfo, pointer);
                COPYBYTESNTOBYTES124(' Hours"}', courseInfo, pointer);
            }
        }
        COPYBYTESNTOBYTES124(']}', courseInfo, pointer);
        return(string(courseInfo));
    }
    function COURSEIDBYUID80(bytes10 CourseUId) private view returns(uint CourseId) {	//inject NONSTANDARD NAMING
        CourseId = 0;
        for (uint i=1; i<=CourseCount;i++)
            if (CourseUIds[i] == CourseUId) {
                CourseId = i;
                break;
            }
        require(CourseId > 0);
    }
    function GETCOURSEINFO85(string memory CourseUId) public view NOTEMPTY511(CourseUId) returns(string memory) {	//inject NONSTANDARD NAMING
        bytes10 _courseUId=bytes10(STRINGTOBYTES32252(CourseUId));
        course memory _course;
        _course = Course[_courseUId];
        require(_course.CourseName.length > 0);
        uint len = 200;
        bytes memory instructorsList = COURSEINSTRUCTORDESCRIPTION202(_courseUId);
        len += instructorsList.length + Institute.length + _course.CourseName.length;
        bytes memory courseInfo = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        COPYBYTESNTOBYTES124('{"Course":', courseInfo, pointer);
        COPYBYTESNTOBYTES124('{"Issuer":"', courseInfo, pointer);
        COPYBYTESNTOBYTES124(Institute, courseInfo, pointer);
        COPYBYTESNTOBYTES124('","Course Id":"', courseInfo, pointer);
        COPYBYTESNTOBYTES124(_courseUId, courseInfo, pointer);
        COPYBYTESNTOBYTES124('","Course Name":"', courseInfo, pointer);
        COPYBYTESTOBYTES381(_course.CourseName, courseInfo, pointer);
        COPYBYTESNTOBYTES124('",', courseInfo, pointer);
        COPYBYTESTOBYTES381(instructorsList, courseInfo, pointer);
        COPYBYTESNTOBYTES124(',"Start Date":"', courseInfo, pointer);
        COPYBYTESNTOBYTES124(_course.StartDate, courseInfo, pointer);
        COPYBYTESNTOBYTES124('","End Date":"', courseInfo, pointer);
        COPYBYTESNTOBYTES124(_course.EndDate, courseInfo, pointer);
        COPYBYTESNTOBYTES124('","Duration":"', courseInfo, pointer);
        COPYBYTESNTOBYTES124( UINTTOBYTESN509(_course.Hours), courseInfo, pointer);
        COPYBYTESNTOBYTES124(' Hours"}}', courseInfo, pointer);
        return(string(courseInfo));
    }
    function GETCOURSES829() public view returns(string memory) {	//inject NONSTANDARD NAMING
        uint len = 50;
        uint i;
        course memory _course;
        for (i=1 ; i <= CourseCount ; i++) {
            _course = Course[CourseUIds[i]];
            len += 200 + _course.CourseName.length;
        }
        bytes memory courses = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        bytes32 hrs;
        COPYBYTESNTOBYTES124('{"Courses":[', courses, pointer);
        for (i=1 ; i <= CourseCount ; i++) {
            if (i > 1)
                COPYBYTESNTOBYTES124(',', courses, pointer);
            _course = Course[CourseUIds[i]];
            COPYBYTESNTOBYTES124('{"Id":"', courses, pointer);
            COPYBYTESNTOBYTES124(CourseUIds[i], courses, pointer);
            COPYBYTESNTOBYTES124('","Name":"', courses, pointer);
            COPYBYTESTOBYTES381(_course.CourseName, courses, pointer);
            COPYBYTESNTOBYTES124('","Start Date":"', courses, pointer);
            COPYBYTESNTOBYTES124(_course.StartDate, courses, pointer);
            COPYBYTESNTOBYTES124('","End Date":"', courses, pointer);
            COPYBYTESNTOBYTES124(_course.EndDate, courses, pointer);
            COPYBYTESNTOBYTES124('","Duration":"', courses, pointer);
            hrs = UINTTOBYTESN509(_course.Hours);
            COPYBYTESNTOBYTES124(hrs, courses, pointer);
            COPYBYTESNTOBYTES124(' Hours"}', courses, pointer);
        }
        COPYBYTESNTOBYTES124(']}', courses, pointer);
        return(string(courses));
    }
    function GETSTUDENTINFO831(string memory NationalId) public view NOTEMPTY511(NationalId) returns(string memory) {	//inject NONSTANDARD NAMING
        bytes10 _nationalId=bytes10(STRINGTOBYTES32252(NationalId));
        bytes memory _student = Student[_nationalId];
        require(_student.length > 0);
        uint len = 150 + Institute.length + _student.length;
        bytes memory studentInfo = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        COPYBYTESNTOBYTES124('{"Student":', studentInfo, pointer);
        COPYBYTESNTOBYTES124('{"Issuer":"', studentInfo, pointer);
        COPYBYTESNTOBYTES124(Institute, studentInfo, pointer);
        COPYBYTESNTOBYTES124('","National Id":"', studentInfo, pointer);
        COPYBYTESNTOBYTES124(_nationalId, studentInfo, pointer);
        COPYBYTESNTOBYTES124('","Name":"', studentInfo, pointer);
        COPYBYTESTOBYTES381(_student, studentInfo, pointer);
        COPYBYTESNTOBYTES124('"}}', studentInfo, pointer);
        return(string(studentInfo));
    }
    function GETSTUDENTS39() public view ONLYOWNER575 returns(string memory) {	//inject NONSTANDARD NAMING
        uint len = 50;
        uint i;
        for (i=1 ; i <= StudentCount ; i++) 
            len += 50 + Student[StudentUIds[i]].length;
        bytes memory students = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        COPYBYTESNTOBYTES124('{"Students":[', students, pointer);
        for (i=1 ; i <= StudentCount ; i++) {
            if (i > 1)
                COPYBYTESNTOBYTES124(',', students, pointer);
            bytes memory _student = Student[StudentUIds[i]];
            COPYBYTESNTOBYTES124('{"National Id":"', students, pointer);
            COPYBYTESNTOBYTES124(StudentUIds[i], students, pointer);
            COPYBYTESNTOBYTES124('","Name":"', students, pointer);
            COPYBYTESTOBYTES381(_student, students, pointer);
            COPYBYTESNTOBYTES124('"}', students, pointer);
        }
        COPYBYTESNTOBYTES124(']}', students, pointer);
        return(string(students));
    }
    function GETCERTIFICATES191() public view ONLYOWNER575 returns(string memory) {	//inject NONSTANDARD NAMING
        uint len = 50;
        uint i;
        len += CertificateCount * 60;
        bytes memory certificates = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        COPYBYTESNTOBYTES124('{"Certificates":[', certificates, pointer);
        for (i = 1 ; i <= CertificateCount ; i++) {
            if (i > 1)
                COPYBYTESNTOBYTES124(',', certificates, pointer);
            COPYBYTESNTOBYTES124('{"Certificate Id":"', certificates, pointer);
            COPYBYTESNTOBYTES124(CertificateUIds[i], certificates, pointer);
            COPYBYTESNTOBYTES124('","Active":', certificates, pointer);
            if (Certificate[CertificateUIds[i]].Enabled)
                COPYBYTESNTOBYTES124('true}', certificates, pointer);
            else
                COPYBYTESNTOBYTES124('false}', certificates, pointer);
        }
        COPYBYTESNTOBYTES124(']}', certificates, pointer);
        return(string(certificates));
    }
    function GETSTUDENTCERTIFICATES469(string memory NationalId) public view NOTEMPTY511(NationalId) returns(string memory) {	//inject NONSTANDARD NAMING
        uint len = 50;
        uint i;
        bytes10 _nationalId=bytes10(STRINGTOBYTES32252(NationalId));
        require(Student[_nationalId].length > 0);
        for (i = 1 ; i <= CertificateCount ; i++) {
            if (StudentUIds[Certificate[CertificateUIds[i]].StudentId] == _nationalId && 
                Certificate[CertificateUIds[i]].Enabled) {
                len += 100 + Course[CourseUIds[Certificate[CertificateUIds[i]].CourseId]].CourseName.length;
            }
        }
        bytes memory certificates = new bytes(len);
        uint[1] memory pointer;
        pointer[0]=0;
        COPYBYTESNTOBYTES124('{"Certificates":[', certificates, pointer);
        bool first=true;
        for (i = 1 ; i <= CertificateCount ; i++) {
            if (StudentUIds[Certificate[CertificateUIds[i]].StudentId] == _nationalId && 
                Certificate[CertificateUIds[i]].Enabled) {
                if (first)
                    first = false;
                else
                    COPYBYTESNTOBYTES124(',', certificates, pointer);
                COPYBYTESNTOBYTES124('{"Certificate Id":"', certificates, pointer);
                COPYBYTESNTOBYTES124(CertificateUIds[i], certificates, pointer);
                COPYBYTESNTOBYTES124('","Course Name":"', certificates, pointer);
                COPYBYTESTOBYTES381(Course[CourseUIds[Certificate[CertificateUIds[i]].CourseId]].CourseName, certificates, pointer);
                COPYBYTESNTOBYTES124('"}', certificates, pointer);
            }
        }
        COPYBYTESNTOBYTES124(']}', certificates, pointer);
        return(string(certificates));
    }
    function GETCERTIFICATE520(string memory CertificateId) public view NOTEMPTY511(CertificateId) returns(string memory) {	//inject NONSTANDARD NAMING
        bytes10 _certificateId = bytes10(STRINGTOBYTES32252(CertificateId));
        require(Certificate[_certificateId].Enabled);
        certificate memory _certificate = Certificate[_certificateId];
        course memory _course = Course[CourseUIds[_certificate.CourseId]];
        bytes memory _student = Student[StudentUIds[_certificate.StudentId]];
        bytes memory certSpec;
        bytes memory instructorsList = COURSEINSTRUCTORDESCRIPTION202(CourseUIds[_certificate.CourseId]);
        uint len = 500;
        len += _course.CourseName.length + instructorsList.length;
        uint[1] memory pointer;
        pointer[0] = 0;
        certSpec = new bytes(len);
        require(_certificate.StudentId > 0);
        require(_certificate.Enabled);
        COPYBYTESNTOBYTES124('{"Certificate":{"Issuer":"', certSpec, pointer);
        COPYBYTESNTOBYTES124(Institute, certSpec, pointer);
        COPYBYTESNTOBYTES124('","Certificate Id":"', certSpec, pointer);
        COPYBYTESNTOBYTES124(_certificateId, certSpec, pointer);
        COPYBYTESNTOBYTES124('","Name":"', certSpec, pointer);
        COPYBYTESTOBYTES381(_student, certSpec, pointer);
        COPYBYTESNTOBYTES124('","National Id":"', certSpec, pointer);
        COPYBYTESNTOBYTES124( StudentUIds[_certificate.StudentId], certSpec, pointer);
        COPYBYTESNTOBYTES124('","Course Id":"', certSpec, pointer);
        COPYBYTESNTOBYTES124(CourseUIds[_certificate.CourseId], certSpec, pointer);
        COPYBYTESNTOBYTES124('","Course Name":"', certSpec, pointer);
        COPYBYTESTOBYTES381(_course.CourseName, certSpec, pointer);
        COPYBYTESNTOBYTES124('","Start Date":"', certSpec, pointer);
        COPYBYTESNTOBYTES124(_course.StartDate, certSpec, pointer);
        COPYBYTESNTOBYTES124('","End Date":"', certSpec, pointer);
        COPYBYTESNTOBYTES124(_course.EndDate, certSpec, pointer);
        COPYBYTESNTOBYTES124('","Duration":"', certSpec, pointer);
        COPYBYTESNTOBYTES124(UINTTOBYTESN509(_course.Hours), certSpec, pointer);
        COPYBYTESNTOBYTES124(' Hours",', certSpec, pointer);
        COPYBYTESTOBYTES381(instructorsList, certSpec, pointer);
        bytes10 _certType = CERTIFICATETYPEDESCRIPTION872(_certificate.CertificateType);
        COPYBYTESNTOBYTES124(',"Course Type":"', certSpec, pointer);
        COPYBYTESNTOBYTES124(_certType, certSpec, pointer);
        COPYBYTESNTOBYTES124('","Result":"', certSpec, pointer);
        COPYBYTESNTOBYTES124(_certificate.Result, certSpec, pointer);
        COPYBYTESNTOBYTES124('"}}', certSpec, pointer);
        return(string(certSpec));
    }
    function CERTIFICATETYPEDESCRIPTION872(uint Type) pure internal returns(bytes10) {	//inject NONSTANDARD NAMING
        if (Type == 1) 
            return('Attendance');
        else if (Type == 2)
            return('Online');
        else if (Type == 3)
            return('Video');
        else if (Type == 4)
            return('ELearning');
        else
            return(bytes10(UINTTOBYTESN509(Type)));
    }
    function GETADMINSTATS408() public view ONLYOWNER575 returns(string memory) {	//inject NONSTANDARD NAMING
        bytes memory stat;
        uint[1] memory pointer;
        pointer[0] = 0;
        stat = new bytes(400);
        COPYBYTESNTOBYTES124('{"Instructors":', stat, pointer);
        COPYBYTESNTOBYTES124(UINTTOBYTESN509(InstructorCount), stat, pointer);
        COPYBYTESNTOBYTES124(',"Courses":', stat, pointer);
        COPYBYTESNTOBYTES124(UINTTOBYTESN509(CourseCount), stat, pointer);
        COPYBYTESNTOBYTES124(',"Students":', stat, pointer);
        COPYBYTESNTOBYTES124(UINTTOBYTESN509(StudentCount), stat, pointer);
        COPYBYTESNTOBYTES124(',"Certificates":', stat, pointer);
        COPYBYTESNTOBYTES124(UINTTOBYTESN509(CertificateCount), stat, pointer);
        COPYBYTESNTOBYTES124('}', stat, pointer);
        return(string(stat));
    }
    function GETSTATS664() public view returns(string memory) {	//inject NONSTANDARD NAMING
        bytes memory stat;
        uint[1] memory pointer;
        pointer[0] = 0;
        stat = new bytes(200);
        COPYBYTESNTOBYTES124('{"Instructors":', stat, pointer);
        COPYBYTESNTOBYTES124(UINTTOBYTESN509(InstructorCount), stat, pointer);
        COPYBYTESNTOBYTES124(',"Courses":', stat, pointer);
        COPYBYTESNTOBYTES124(UINTTOBYTESN509(CourseCount), stat, pointer);
        COPYBYTESNTOBYTES124('}', stat, pointer);
        return(string(stat));
    }
    function GETCOURSESTUDENTS296(string memory InstructorUId, string memory CourseUId) public view NOTEMPTY511(CourseUId) returns(string memory) {	//inject NONSTANDARD NAMING
        bytes10 _instructorUId = bytes10(STRINGTOBYTES32252(InstructorUId));
        bytes10 _courseUId = bytes10(STRINGTOBYTES32252(CourseUId));
        uint i;
        uint _instructorId = 0;

        for (i = 1;  i<= InstructorCount; i++)
            if (InstructorUIds[i] == _instructorUId) {
                _instructorId = i;
                break;
            }
//        require(_instructorId != 0);
        uint _courseId = 0;

        for (i = 1;  i<= CourseCount; i++)
            if (CourseUIds[i] == _courseUId) {
                _courseId = i;
                break;
            }

        require(_courseId != 0);
        bool found = false;
        for (i = 0; i < CourseInstructor.length; i++)
            if (CourseInstructor[i].InstructorId == _instructorId && CourseInstructor[i].CourseId == _courseId) {
                found = true;
                break;
            }
        require(found || (msg.sender == owner));
        course memory _course = Course[_courseUId];
        bytes memory students;
        uint[1] memory pointer;
        pointer[0] = 0;
        bytes memory studentsList = COURSESTUDENTDESCRIPTION913(_courseId);
        bytes memory instructorsList = COURSEINSTRUCTORDESCRIPTION202(CourseUIds[_courseId]);
        uint len = 150 + studentsList.length + instructorsList.length + Institute.length + _course.CourseName.length;
        students = new bytes(len);
        COPYBYTESNTOBYTES124('{"Course":{"Issuer":"', students, pointer);
        COPYBYTESNTOBYTES124(Institute, students, pointer);
        COPYBYTESNTOBYTES124('","Course Id":"', students, pointer);
        COPYBYTESNTOBYTES124(_courseUId, students, pointer);
        COPYBYTESNTOBYTES124('","Course Name":"', students, pointer);
        COPYBYTESTOBYTES381(_course.CourseName, students, pointer);
        COPYBYTESNTOBYTES124('",', students, pointer);
        COPYBYTESTOBYTES381(instructorsList, students, pointer);
        COPYBYTESNTOBYTES124(',"Start Date":"', students, pointer);
        COPYBYTESNTOBYTES124(_course.StartDate, students, pointer);
        COPYBYTESNTOBYTES124('","End Date":"', students, pointer);
        COPYBYTESNTOBYTES124(_course.EndDate, students, pointer);
        COPYBYTESNTOBYTES124('","Duration":"', students, pointer);
        COPYBYTESNTOBYTES124( UINTTOBYTESN509(_course.Hours), students, pointer);
        COPYBYTESNTOBYTES124(' Hours",', students, pointer);
        COPYBYTESTOBYTES381(studentsList, students, pointer);
        COPYBYTESNTOBYTES124('}}', students, pointer);
        return(string(students));
    }
    function COURSESTUDENTDESCRIPTION913(uint CourseId) internal view returns(bytes memory) {	//inject NONSTANDARD NAMING
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
        COPYBYTESNTOBYTES124('"Students":[', students, pointer);
        bool first = true;
        for (i = 1; i <= CertificateCount; i++) {
            if (Certificate[CertificateUIds[i]].CourseId == CourseId) {
                if (first)
                    first = false;
                else
                    COPYBYTESNTOBYTES124(',', students, pointer);
                _studentId = StudentUIds[Certificate[CertificateUIds[i]].StudentId];
                COPYBYTESNTOBYTES124('{"National Id":"', students, pointer);
                COPYBYTESNTOBYTES124(_studentId, students, pointer);
                COPYBYTESNTOBYTES124('","Name":"', students, pointer);
                COPYBYTESTOBYTES381(Student[_studentId], students, pointer);
                COPYBYTESNTOBYTES124('"}', students, pointer);
            }
        }
        COPYBYTESNTOBYTES124(']', students, pointer);
        return(students);
   }
   function COURSEINSTRUCTORDESCRIPTION202(bytes10 CourseUId) internal view returns(bytes memory) {	//inject NONSTANDARD NAMING
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
            COPYBYTESNTOBYTES124('"Instructor":"', instructors, pointer);
            COPYBYTESTOBYTES381(Instructor[InstructorUIds[courseInstructors[0]]], instructors, pointer);
            COPYBYTESNTOBYTES124('"', instructors, pointer);
        }
        else {
            COPYBYTESNTOBYTES124('"Instructors":[', instructors, pointer);
            for (i=0; i<courseInstructorCount; i++){
                if (i > 0)
                    COPYBYTESNTOBYTES124(',', instructors, pointer);
                COPYBYTESNTOBYTES124('"', instructors, pointer);
                COPYBYTESTOBYTES381(Instructor[InstructorUIds[courseInstructors[i]]], instructors, pointer);
                COPYBYTESNTOBYTES124('"', instructors, pointer);
            }
            COPYBYTESNTOBYTES124(']', instructors, pointer);
        }
        return(instructors);
   }
}