select * from chatinfo
select * from userinfo

INSERT INTO chatinfo (senduser, chattext, chatdate, receiveuser)
        VALUES (#{senduser}, #{chattext}, NOW(), "smhrd2")
        
        SELECT companyname, noticejobcode, noticeregdate, noticeperiod 
		FROM noticeinfo
		ORDER BY noticeregdate DESC
		
		UPDATE userinfo
		SET	userpw = '12345',
		userphone = '1234567',
		useremail = 'SSS@NAVER.COM',
		userobstccode = '15',
		userparentphone = '21342134',
		userdiv = 'A'
		WHERE userid = 'smhrd';
		
		UPDATE userinfo
		SET
		userpw = '1234',
		userphone = '1234',
		useremail = 'gd',
		userbirth = '2023-05-01',
		useraddress = 'ㅎㅇ',
		userobstccode = '1',
		userparentphone = '1235',
		userdiv = 'A'
		WHERE userid = #{userid}