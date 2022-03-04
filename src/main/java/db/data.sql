INSERT INTO Author(Name, Biography, Email, Address)
VALUES
("Ngo Sa Thach", "", "ngosathach@gmail.com", "125 Pham Hung"),
("Nguyen Nhat Anh", "", "nguyenanh@gmail.com", "231 Pham Van Dong"),
("Trang Ha", "", "trangha@gmail.com", "53 To Huu"),
("Nguyen Phong Viet", "", "nguyenphongviet@gmail.com", "213 Dong Mac"),
("Anh Khang", "", "anhkhang@gmail.com", "3213 Pham Hung"),
("Son Paris", "", "sonparis@gmail.com", "125 Pham Hung"),
("Gao", "", "gao@gmail.com", "39172 Mun Hung"),
("Nguyen Ngoc Thach", "", "nguyenngocthach@gmail.com", "125 Pham Hung"),
("Do Nhat Nam", "", "donhatnam@gmail.com", "125 Pham Hung"),
("Hamlet Truong", "", "hamlettruong@gmail.com", "125 Pham Hung"),
("Iris Cao", "", "iriscao@gmail.com", "125 Pham Hung");

INSERT INTO Category (Name)
VALUES
("Nha Sach Tiki"),
("Nha Sach Tong Hop"),
("Sach Kien Thuc Tong Hop"),
("Luat Tam Thuc - Giai Ma Ma Tran Vu Tru"),
("Sach Ky Nang Song"),
("Sach Tu Duy - Ky Nang Song"),
("Nha Sach Gia Truyen"),
("How Psychology Works"),
("Nha Sach Tuoi Tre"),
("Nha Sach Nhi Dong");

INSERT INTO Publisher (Name, Address)
VALUES
("Nha Xuat Ban Phu Nu", "321 Dong Da"),
("Nha Xuat Ban Nhi Dong", "321 Nguyen Hue"),
("Nha Xuat Ban Tuoi Tre", "321 Hang Tung"),
("Nha Xuat Ban Phan Thi", "321 Cay Da"),
("Nha Xuat Ban Tong Hop TP.HCM", "111 Quang Trung"),
("Nha Xuat Ban Thanh Nien", "45 Hang Dong"),
("Nha Xuat Ban Thieu Nhi", "321 Dong Da"),
("Nha Xuat Ban The Gioi", "3312 Ma Cao"),
("Nha Xuat Ban Hong Duc", "575 Tran Phu"),
("Nha Xuat Ban Phan Thi", "386 Dong Da");

INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (3,2,1,"2-516-718-9126","Cây Cam Ngọt Của Tôi","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (1,"7573467763",70200,"Cây Cam Ngọt Của Tôi",0.35,"Vị chua chát của cái nghèo hòa trộn với vị ngọt ngào khi khám phá ra những điều khiến cuộc đời này đáng số một tác phẩm kinh điển của Brazil.- Booklist“Một cách nhìn cuộc sống gần như hoàn chỉnh t...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (1,1,"https://salt.tikicdn.com/ts/product/5e/18/24/2a6154ba08df6ce6161c13f4303fa19e.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (5,7,5,"5-871-4405-1478","Luật Tâm Thức - Giải Mã Ma Trận Vũ Trụ","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (2,"8927857510",211100,"Luật Tâm Thức - Giải Mã Ma Trận Vũ Trụ",0.25,"Dịch bệnh, thiên tai, chiến tranh… có phải là lời cảnh cáo của tự nhiên đến con người?Biến đổi khí hậu là một nước đi chính trị hay chỉ là sự thay đổi của Trái Đất theo chu kỳ?UFO, người ngoài hàn...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (2,1,"https://salt.tikicdn.com/ts/product/c9/34/25/78e6425fc06d816d68a7f0849f51cc33.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (2,2,"https://salt.tikicdn.com/ts/product/10/a4/6e/a5d128a10ec4303c69a94bcee0af1fac.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (2,3,"https://salt.tikicdn.com/ts/product/57/d9/93/1d6d6978691b93613975d35e93cb54a7.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (2,4,"https://salt.tikicdn.com/ts/product/ca/c1/57/90295ad16d3964fb44232dab029debae.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (2,5,"https://salt.tikicdn.com/ts/product/cf/c5/5f/1d1adee64398cbea593311e2d5a140ca.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (7,9,2,"1-226-2676-6185","Rèn Luyện Tư Duy Phản Biện","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (3,"1047185361",56900,"Rèn Luyện Tư Duy Phản Biện",0.43,"Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy n...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (3,1,"https://salt.tikicdn.com/ts/product/22/cb/a9/524a27dcd45e8a13ae6eecb3dfacba7c.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (3,2,"https://salt.tikicdn.com/ts/product/71/c2/4b/58afce3cf6c10b648d1d28252fdf5e48.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (4,6,2,"5-725-3981-67","How Psychology Works - Hiểu Hết Về Tâm Lý Học","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (4,"5851830177",224300,"How Psychology Works - Hiểu Hết Về Tâm Lý Học",0.25,"MỘT TRONG NHỮNG CUỐN SÁCH MỞ KHÓA HỮU ÍCH NHẤT VỀ TƯ DUY, KÝ ỨC VÀ CẢM XÚC CỦA CON NGƯỜI!Ám sợ là gì, ám sợ có thực sự đáng sợ không? Rối loạn tâm lý là gì, làm thế nào để thoát khỏi tình trạng suy n...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (4,1,"https://salt.tikicdn.com/ts/product/2b/84/ff/cb34637573525a998596b58d6939411e.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (1,2,5,"9-397-898-7487","Tự Học 2000 Từ Vựng Tiếng Anh Theo Chủ Đề","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (5,"4755334634",51400,"Tự Học 2000 Từ Vựng Tiếng Anh Theo Chủ Đề",0.21,"Tự Học 2000 Từ Vựng Tiếng Anh Theo Chủ ĐềNghe nói đọc viết là 4 kĩ năng quan trọng để có thể học và sử dụng tốt tiếng Anh - ngôn ngữ toàn cầu. Tuy nhiên không phải ai cũng có thể thành thạo những kĩ ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (5,1,"https://salt.tikicdn.com/ts/product/d5/53/0e/fc00028419754638dd5b250abbcb0de7.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (5,2,"https://salt.tikicdn.com/ts/product/a8/cb/5e/f5e08d0b9dde25049d210a9282e4b32d.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (5,3,"https://salt.tikicdn.com/ts/product/ff/aa/8f/8f074f7b26a06be9d9476e7ffee7af1b.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (10,10,6,"3-403-2898-6405","Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình Thản","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (6,"7384654678",95300,"Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình Thản",0.24,"Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình ThảnBạn mong muốn điều gì từ cuộc sống này? Có thể câu trả lời của bạn là muốn có một người bạn đời biết quan tâm, một công việc tốt và một ngôi nh...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (6,1,"https://salt.tikicdn.com/ts/product/97/61/91/a9b293f184d4dbbc2afc416b539f2bca.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (10,7,7,"5-160-8352-8257","Những Tù Nhân Của Địa Lý","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (7,"6158989198",157000,"Những Tù Nhân Của Địa Lý",0.25,"Khi chúng ta đang vươn tới những vì sao, chính bởi những thách thức đặt ra phía trước mà chúng ta có lẽ sẽ phải chung tay để ứng phó: du hành vào vũ trụ không phải với tư cách người Nga, người Trung ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (7,1,"https://salt.tikicdn.com/ts/product/8d/96/9e/c0c1f23db756d50b1944dff9c3988753.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (6,9,5,"4-602-9600-4074","Nhà Giả Kim (Tái Bản 2020)","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (8,"2183765966",60100,"Nhà Giả Kim (Tái Bản 2020)",0.24,"Sơ lược về tác phẩmTất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.Tiểu ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (8,1,"https://salt.tikicdn.com/ts/product/45/3b/fc/aa81d0a534b45706ae1eee1e344e80d9.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (4,7,1,"4-699-8153-1219","Đại Dương Đen - Những Câu Chuyện Từ Thế Giới Của Trầm Cảm","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (9,"1291862645",208800,"Đại Dương Đen - Những Câu Chuyện Từ Thế Giới Của Trầm Cảm",0.0,"Tôi sợ những cơn của mình, chúng xâm chiếm não bộ tôi, nhấn chìm lý trí của tôi, chúng phơi bày sự đau đớn, cô đơn, nỗi sầu thảm suốt những năm tháng niên thiếu của tôi, sự ám ảnh của bạo lực, của lẻ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (9,1,"https://salt.tikicdn.com/ts/product/f7/fb/9a/e8b9a94478dc887c4b84b6b6439f6335.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (8,10,3,"4-606-3309-6791","Kiếp Nào Ta Cũng Tìm Thấy Nhau","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (10,"1782822407",56440,"Kiếp Nào Ta Cũng Tìm Thấy Nhau",0.34,"Kiếp Nào Ta Cũng Tìm Thấy NhauKiếp nào ta cũng tìm thấy nhau là cuốn sách thứ ba của Brain L. Weiss – một nhà tâm thần học có tiếng. Trước đó ông đã viết hai cuốn sách: cuốn đầu tiên là Ám ảnh từ kiế...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (10,1,"https://salt.tikicdn.com/ts/product/c9/7c/04/67db9bf2590d75f978e68f9dcfe0db9a.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (7,8,2,"2-201-7578-8847","Giải thích Ngữ pháp tiếng Anh (Tái Bản)","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (11,"341776799",134500,"Giải thích Ngữ pháp tiếng Anh (Tái Bản)",0.25,"Ngữ pháp Tiếng Anh tổng hợp các chủ điểm ngữ pháp trọng yếu mà học sinh cần nắm vững. Các chủ điểm ngữ pháp được trình bày rõ ràng, chi tiết. Sau mỗi chủ điểm ngữ pháp là phần bài tập & đáp án nhằm gi...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (11,1,"https://salt.tikicdn.com/ts/product/9c/ef/be/b084b999e1f8634004e21551c525cafc.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (2,2,4,"5-299-1069-2312","Sổ Tay Ghi Chép MỤC TIÊU - KẾ HOẠCH: My Day My Life","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (12,"7199068777",28800,"Sổ Tay Ghi Chép MỤC TIÊU - KẾ HOẠCH: My Day My Life",0.0,"Quyển Sổ Tay My Day My Life———Sổ Tay My Day My Life không phải là một quyển sổ tay ghi chép thông thường, nó là một công cụ được thiết kế logic và khoa học từ bí quyết của những người thành công để gi...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (12,1,"https://salt.tikicdn.com/ts/product/59/55/c3/efc937e8a0244a04f670ff316846a4f7.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (12,2,"https://salt.tikicdn.com/ts/product/1f/01/bf/9a0342fcecf5439a7f307ba1cd715d37.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (12,3,"https://salt.tikicdn.com/ts/product/74/b2/3b/f5de02599634ce35d3f2b2c8b8c26b05.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (12,4,"https://salt.tikicdn.com/ts/product/e4/18/a6/1ac34c22db7d743d4fa87fc990370751.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (12,5,"https://salt.tikicdn.com/ts/product/db/ac/e2/2180ddfb663f88c9331786e892958e20.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (3,10,5,"7-591-9300-8826","Yêu Những Điều Không Hoàn Hảo","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (13,"3498007461",118000,"Yêu Những Điều Không Hoàn Hảo",0.15,"Yêu Những Điều Không Hoàn HảoĐại đức Hae Min sinh ra và lớn lên tại Hàn Quốc. Sau khi hoàn thành bằng Thạc sĩ Tôn giáo học đối chiếu ở Đại học Havard và Tiến sĩ Tôn giáo học ở Đại học Princeton, ông ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (13,1,"https://salt.tikicdn.com/ts/product/54/55/d6/4ceb6ba3bd81614df8ff4c1411b11f59.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (4,6,6,"3-618-326-7241","Nóng Giận Là Bản Năng , Tĩnh Lặng Là Bản Lĩnh","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (14,"6077460249",65600,"Nóng Giận Là Bản Năng , Tĩnh Lặng Là Bản Lĩnh",0.26,"Sai lầm lớn nhất của chúng ta là đem những tật xấu, những cảm xúc tiêu cực trút bỏ lên những người xung quanh, càng là người thân càng dễ gây thương tổn.Cái gì cũng nói toạc ra, cái gì cũng bộc lộ hế...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (14,1,"https://salt.tikicdn.com/ts/product/70/9a/98/e6d54019a2079b9565114bce93b245b7.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (5,1,6,"1-602-7555-762","Thay Đổi Cuộc Sống Với Nhân Số Học","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (15,"4157199526",179000,"Thay Đổi Cuộc Sống Với Nhân Số Học",0.28,"Thay Đổi Cuộc Sống Với Nhân Số HọcCuốn sách Thay đổi cuộc sống với Nhân số học là tác phẩm được chị Lê Đỗ Quỳnh Hương phát triển từ tác phẩm gốc The Complete Book of Numerology của tiến sỹ David A....");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (15,1,"https://salt.tikicdn.com/ts/product/15/11/f8/56b303e000cb42faada663569fc5d7c9.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (15,2,"https://salt.tikicdn.com/ts/product/15/18/1a/72becd43b4764c0904c049eba3377fe1.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (15,3,"https://salt.tikicdn.com/ts/product/56/fc/00/5654e9dc557fad16a4eda4b35d4837ff.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (15,4,"https://salt.tikicdn.com/ts/product/8c/52/24/0cdce8c01252f9798255b95790219f73.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (2,6,6,"3-572-856-7976","Những Giấc Mơ Ở Hiệu Sách Morisaki","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (16,"4434606620",47100,"Những Giấc Mơ Ở Hiệu Sách Morisaki",0.22,"Những Giấc Mơ Ở Hiệu Sách Morisaki Bị người yêu lừa dối, Takako bỏ việc và rơi vào chuỗi ngày ngủ triền miên để trốn tránh nỗi buồn. Thế rồi, một cuộc điện thoại từ người cậu ruột cả 10 năm trời khôn...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (16,1,"https://salt.tikicdn.com/media/catalog/product/1/x/1x2acr3d.u4972.d20170419.t115542.562440.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (1,6,1,"8-355-7159-5489","Đàn Ông Sao Hỏa Đàn Bà Sao Kim","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (17,"4903109400",131600,"Đàn Ông Sao Hỏa Đàn Bà Sao Kim",0.30,"Ngày xửa ngày xưa, những người sao Hỏa và sao Kim đã gặp gỡ, yêu nhau và sống hạnh phúc bởi họ tôn trọng và chấp nhận mọi điều khác biệt. Rồi họ đến Trái Đất và chứng lãng quên đã xảy ra: Họ quên rằng...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (17,1,"https://salt.tikicdn.com/ts/product/0a/f6/38/bc10734989977da424642a1c4750eee2.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (17,2,"https://salt.tikicdn.com/ts/product/29/43/01/bd04f0946bed192d8cf7875167b0e3bd.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (3,2,9,"6-411-5902-3643","Muôn Kiếp Nhân Sinh 2","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (18,"9317867927",155440,"Muôn Kiếp Nhân Sinh 2",0.42,"CUỐN SÁCH CỦA NHỮNG CÁNH BƯỚM RUNG ĐỘNGTác phẩm Muôn Kiếp Nhân Sinh tập 1 của tác giả Nguyên Phong xuất bản giữa tâm điểm của đại dịch đã thực sự tạo nên một hiện tượng xuất bản hiếm có ở Việt Nam. C...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (18,1,"https://salt.tikicdn.com/ts/product/9b/4b/8a/04ffa4c4673af50ef2e594bf8e4f6fa1.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (18,2,"https://salt.tikicdn.com/ts/product/04/43/04/d8efbe484105e8030012d15fe320b328.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (18,3,"https://salt.tikicdn.com/ts/product/81/9b/07/659126777a932f86eab83f160b5142a0.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (18,4,"https://salt.tikicdn.com/ts/product/c8/d3/67/1794c4a3baab6fe9199db5728d5faf32.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (18,5,"https://salt.tikicdn.com/ts/product/ca/19/f9/ed18147c47ec929e51157e7dbb690407.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (10,3,5,"5-312-8083-5787","Tâm Lý Học Về Tiền","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (19,"9815908230",112900,"Tâm Lý Học Về Tiền",0.40,"Tiền bạc có ở khắp mọi nơi, nó ảnh hưởng đến tất cả chúng ta, và khiến phần lớn chúng ta bối rối. Mọi người nghĩ về nó theo những cách hơi khác nhau một chút. Nó mang lại những bài học có thể được áp ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (19,1,"https://salt.tikicdn.com/ts/product/83/23/b7/14a42ae4f66c9b8b298aaef4b9671442.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (19,2,"https://salt.tikicdn.com/ts/product/d8/79/d9/8c3f38ce32884e18b83d73260173b16c.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (9,6,1,"0-213-1036-3032","Tương Lai Sau Đại Dịch Covid","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (20,"92685620",71500,"Tương Lai Sau Đại Dịch Covid",0.35,"Tương lai sau đại dịch Covid được viết ra trong bối cảnh một đại dịch ở tầm mức thảm họa toàn cầu đang bắt đầu làm lung lay các đế chế kinh tế, đe dọa sinh kế người dân, và nhanh chóng làm thay đổi to...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (20,1,"https://salt.tikicdn.com/ts/product/33/5d/bb/3cca555b4a10fa0d79d8d229c6110218.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (2,3,8,"0-353-6285-6741","Muôn Kiếp Nhân Sinh (Many Lives - Many Times)","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (21,"949869249",102500,"Muôn Kiếp Nhân Sinh (Many Lives - Many Times)",0.39,"Muôn kiếp nhân sinh là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm 2020 ghi lại những câu chuyện, trải nghiệm tiền kiếp kỳ lạ từ nhiều kiếp sống của người bạn tâ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (21,1,"https://salt.tikicdn.com/ts/product/30/ee/5a/e2aed009bb558b5d2cfbbe157b428ba4.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (21,2,"https://salt.tikicdn.com/media/catalog/producttmp/e9/5e/bd/14016ef6b77f95fb86a93883932b1bca.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (21,3,"https://salt.tikicdn.com/media/catalog/producttmp/d8/d8/29/c8f1642914219921425485aa6296a191.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (21,4,"https://salt.tikicdn.com/media/catalog/producttmp/83/06/c3/d804e8c109f13258bc9a7f5d2a39bc04.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (21,5,"https://salt.tikicdn.com/media/catalog/producttmp/af/95/32/80640c43b22ada78e777cb4c334a79fb.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (6,4,9,"5-347-3660-730","Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA (Tái Bản)","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (22,"1638086321",77900,"Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA (Tái Bản)",0.26,"Điều Kỳ Diệu Của Tiệm Tạp HóaMột đêm vội vã lẩn trốn sau phi vụ khoắng đồ nhà người, Atsuya, Shota và Kouhei đã rẽ vào lánh tạm trong một căn nhà hoang bên con dốc vắng người qua lại. Căn nhà có vẻ k...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (22,1,"https://salt.tikicdn.com/ts/product/dd/49/7f/ab94b8b2e35c49fc38b063fae4e8266a.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (5,1,1,"1-54-319-4204","Mindmap English Grammar - Ngữ Pháp Tiếng Anh Bằng Sơ Đồ Tư Duy","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (23,"8590914870",114000,"Mindmap English Grammar - Ngữ Pháp Tiếng Anh Bằng Sơ Đồ Tư Duy",0.40,"Ngữ Pháp Tiếng Anh Bằng Sơ Đồ Tư Duy5 Sai lầm khi học khiến ngữ pháp tiếng Anh của bạn MÃI KHÔNG KHÁ LÊN NỔI!Quá chú trọng vào công thứcPhương pháp này rất hữu hiệu cho các bạn học ngữ pháp chỉ đ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (23,1,"https://salt.tikicdn.com/ts/product/8d/dd/67/cd9aa1dcdfa1e47b853b9b01d9802c59.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (23,2,"https://salt.tikicdn.com/ts/product/e1/ea/6c/61b03c007299df2b9756dbcc922019bd.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (5,6,4,"0-355-2577-9242","Payback Time - Ngày Đòi Nợ","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (24,"6886644499",299000,"Payback Time - Ngày Đòi Nợ",0.0,"Trong chứng khoán và thị trường tài chính, dám tham gia đầu tư cũng là một thành công tâm lý ban đầu. Dù vậy, 95% nhà đầu tư Việt Nam thuộc nhóm nhà đầu tư nhỏ lẻ với vốn kiến thức tài chính vô cùng ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (24,1,"https://salt.tikicdn.com/ts/product/64/cd/ba/c12f6fca49de9767c6c167c0030f7985.png");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (24,2,"https://salt.tikicdn.com/ts/product/32/ca/ea/1f4ab02e3319b44bd6a49e53e38a6805.png");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (24,3,"https://salt.tikicdn.com/ts/product/38/a0/4a/01528cf7de4c9c0f112d69ca87e47a87.png");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (24,4,"https://salt.tikicdn.com/ts/product/80/69/fd/dff44ed26b3c50229721eaead49cc4be.png");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (9,9,3,"7-540-4461-3540","Mind Map English Vocabulary - Từ Vựng Tiếng Anh Qua Sơ Đồ Tư Duy","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (25,"6925706387",128700,"Mind Map English Vocabulary - Từ Vựng Tiếng Anh Qua Sơ Đồ Tư Duy",0.35,"Mind Map English Vocabulary -Từ vựng tiếng Anh qua sơ đồ tư duyBạn đang gặp khó khăn với việc học từ vựng Tiếng Anh khi thường xuyên học trước quên sau.Bạn đang cần một phương pháp học tập mới giúp ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (25,1,"https://salt.tikicdn.com/ts/product/94/bb/09/fa62fc7ca444357d28120ded12c87ff3.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (25,2,"https://salt.tikicdn.com/ts/product/8e/08/82/15e7ad349c9ed9a244b03fbf3a078a0e.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (25,3,"https://salt.tikicdn.com/ts/product/aa/51/23/d7d634cc8d8b73d496180969623e61aa.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (25,4,"https://salt.tikicdn.com/ts/product/a5/cb/c4/ff6c083d669cfacaec6c0425cdde6355.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (25,5,"https://salt.tikicdn.com/ts/product/04/9d/5d/4bf95dab34408a198b400da27a749237.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (10,6,2,"2-807-7746-5639","Horimiya 7","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (26,"9802548498",33500,"Horimiya 7",0.16,"Câu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị! Vốn được xếp vào hàng mỹ nam, Miyamura vẫn phải chịu lu mờ trước nhân vật mới: Yanagi Akane lấp la lấp lánh! Hori đột nhiên yêu cầu Miyamura cư...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (26,1,"https://salt.tikicdn.com/ts/product/96/f2/be/51d1139174769fe6f25a58277b5e759f.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (9,2,7,"3-78-3298-6903","Nhà Đầu Tư Thông Minh (Tái Bản 2020)","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (27,"9751503604",142400,"Nhà Đầu Tư Thông Minh (Tái Bản 2020)",0.28,"Tác Phẩm Kinh Điển Về Tư Vấn Đầu TưLà nhà tư vấn đầu tư vĩ đại nhất của thế kỷ 20, Benjamin Graham đã giảng dạy và truyền cảm hứng cho nhiều người trên khắp thế giới. Triết lý đầu tư theo giá trị“ c...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (27,1,"https://salt.tikicdn.com/ts/product/3e/6d/af/716b044e9580b7bb939e7a0b658fd087.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (1,6,3,"0-825-1298-1509","Bước Chậm Lại Giữa Thế Gian Vội Vã (Tái Bản)","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (28,"2405753405",64300,"Bước Chậm Lại Giữa Thế Gian Vội Vã (Tái Bản)",0.24,"Bước Chậm Lại Giữa Thế Gian Vội Vã (Tái Bản)Chen vai thích cánh để có một chỗ bám trên xe buýt giờ đi làm, nhích từng xentimét bánh xe trên đường lúc tan sở, quay cuồng với thi cử và tiến độ công việ...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (28,1,"https://salt.tikicdn.com/ts/product/7a/18/8e/2f70de3ea7eec9c34f55e402254e27ed.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (2,9,6,"9-582-13-3337","Hiểu Về Trái Tim (Tái Bản)","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (29,"1375934435",112500,"Hiểu Về Trái Tim (Tái Bản)",0.18,"Hiểu Về Trái Tim – Cuốn Sách Mở Cửa Thề Giới Cảm Xúc Của Mỗi NgườiXuất bản lần đầu tiên vào năm 2011, Hiểu Về Trái Tim trình làng cũng lúc với kỷ lục: cuốn sách có số lượng in lần đầu lớn nhất: 100....");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (29,1,"https://salt.tikicdn.com/ts/product/52/bc/60/7f4b9571a3119fb493a31cedb71edee9.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (29,2,"https://salt.tikicdn.com/ts/product/78/e0/23/0fab8ef76f703758dd4f2347b8a3eb62.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (29,3,"https://salt.tikicdn.com/ts/product/d1/ec/e1/28986af615827ca900c6b69794095d80.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (29,4,"https://salt.tikicdn.com/ts/product/f6/07/71/babbb26fed6550b948d65818e1d4bc08.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (29,5,"https://salt.tikicdn.com/ts/product/14/c2/fd/89eae00fd04df203b21103cfc9902524.jpg");
INSERT INTO Book(CategoryID, PublisherID, AuthorID, ISBN, Title, Language, PublicationDate, NumberOfPage) VALUES (10,2,3,"3-243-8453-3132","Tâm Lý Học - Phác Họa Chân Dung Kẻ Phạm Tội","vn","2020-10-01",254);
INSERT INTO BookItem(BookID, Barcode, Prices, Header, Discount, Description) VALUES (30,"510630036",101900,"Tâm Lý Học - Phác Họa Chân Dung Kẻ Phạm Tội",0.30,"TÂM LÝ HỌC TỘI PHẠM - PHÁC HỌA CHÂN DUNG KẺ PHẠM TỘITội phạm, nhất là những vụ án mạng, luôn là một chủ đề thu hút sự quan tâm của công chúng, khơi gợi sự hiếu kỳ của bất cứ ai. Một khi đã bắt đầu th...");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (30,1,"https://salt.tikicdn.com/ts/product/e4/a3/52/4845a31ebb7c0b75766ef9272506f236.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (30,2,"https://salt.tikicdn.com/ts/product/50/37/95/96a6966d0b598f5b2adc22cce8aef865.jpg");
INSERT INTO BookItem_images (BookItemID, BookItemIndex, Images) VALUES (30,3,"https://salt.tikicdn.com/ts/product/cb/79/53/7cf60ac4e52cb3f61aa1b4986a0efee6.jpg");