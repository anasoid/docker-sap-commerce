update users set passwd ='1234' , p_passwordencoding ='plain', p_logindisabled=0 where passwd is  NULL and p_customerid is not null;
