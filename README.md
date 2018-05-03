视觉信息质量感知模型及评价方法
视觉信息指可通过人类视觉系统感知到的信息，如图像、视频、文字等，其中图像是较为重要和普遍的方式。图像相比与其他方式更为简洁和直观，如要表达一个电路系统是的连接方式，用文字表示需要考虑语言、语法等问题，而用图像只需将连接的接口清晰的展示出来即可。在现实生活中图像的使用范围越来越广泛，如航海捕鱼时用声呐探测海底，然后通过声呐图将海底的情况展示出来，渔民可以直接的察觉鱼群的分布。为了更好的传递信息，需要不断改善图片质量。
图片质量可理解为图片向人或者设备传达信息的能力，这关系到视觉信息的充分性和准确性。大多数学者是以图片的保真度和可懂性为图片质量的评价准则。
要获取一张质量好即能够传达信息的图片要经过采集、存储、传输、重现4个过程。其中每一个过程都可能会引入失真，例如在采集过程中由于光学感知器件性能不理想，可能会引入白噪声。需要一种评判机制来判断图片是否发生了失真，同时在人们设计新的传输系统等的时候评估它的性能。故而图像质量评价引起了人们广泛的重视。
图像质量评价可以用来动态地检测图像质量的变化和实时的调整图像处理系统的性能。如在实时拍摄的过程中，可以通过图像质量评价来调整图像参数，以得到清晰图像。 
根据评价主体的不同，现有的图像质量评价可分为主观评价和客观评价。主观评价以人为评价主体，根据一定的评价准则设计合理的评价试验，通过人的主观打分得到评价分数。评价结果有两种表示方式，一种是平均主观分数（Mean Opinion Score，MOS），表示失真图像的绝对质量；另一种为差异平均主观分数（Differential Mean Opinion Score，DMOS），表示失真图像与原始图像评价分数的局对差。这两种分数之间可以转化，MOS等于100减去DMOS值。客观评价是除了主观评价之外的评价方法，例如可通过评价图片的PSNR得到图片质量。主观评价需要组织人员进行打分，操作复杂、还需要考虑实验对象对失真的敏感度、打分误差等因素实现起来比较复杂。与它相反，客观图像质量评价可通过计算机程序自主打分，实现方便，故而得到了研究人员的广泛重视。
在客观图像质量评价中根据参考无失真图像的不同程度可分为全参考性、部分参考型、无参考型图像质量评价4。
全参考性需要完整的无失真图像，通过对比图像的信息差异得到图像质量，全参考型图像质量评价是目前图像质量评价最为可靠的评价方法。最简单的无参考型图像质量评价方法为均方误差（Mean Squared Error，MSE）和峰值信噪比（Peak Sigal-to-Noise Ratio，PSNR），它们直接对失真图像和参考图像的灰度值进行计算，计算简单，但是不能很好的符合人类的视觉感知特性，故而评价效果不好。在最近的几十年研究人员提出了许多方法，主要可分为两类，基于人类视觉特性的模型和基于信息论的模型。基于人类视觉特性是使用一个误差可调节框架来模拟人类的感知特性3，典型的如Daly提出的视觉差分预测器的模型5 ；Lubin模型 6。Wang等人提出了基于结构相似度（Structural Similarity，SSIM）的质量测评，对参考图像的亮度、对比度和结构信息进行比较，得到较好结果。许多学者在此基础上进行改进7， Chen等人提出了基于梯度的结构相似度（GSSIM）,把SSIM中对对比度和结构的比较改为对参考图像和失真图像的梯度图像进行计算8。基于信息论模型是从信息论的角度，利用自然场景统计特性来评价图像质量的保真度准则，典型方法有Sheikh等人提出的自然场景分析的方法IFC和VIF，9 10通过测量参考图像和失真图像共同信息的多少来评价失真图像的质量。
部分参考型只需要无失真图像的部分特征即可。典型的部分参考型评价方法有基于多尺度的方法2，如Gao等人提出的基于多尺度几何分析的方法等。11
无参考型图像质量评价可大致分为两类，一类是面向特定失真的无参考型图像质量评价算法，如对图像模糊和噪声的研究，针对块效应的评价、针对JPEG压缩和JPEG2000压缩的评价等；一类是非特定失真的无参考型图像质量算法，如基于支持向量机的方法，基于概率模型的方法和基于码本的方法等1。
本文提出了一种基于S-CIELAB的全参考型图像质量评价方法和基于稀疏表示的无参考型图像质量评价方法。在第一章中主要介绍了图像质量评价的研究背景及意义。在第二掌中介绍了两种模型中的重要概念，颜色空间的转化、稀疏表示、字典建立。在第三章中介绍了两种算法的基本流程。基于S-CIELAB的全参考型图像质量评价方法先将彩色图像从RGB颜色空间转化为S-CIELAB颜色空间，然后利用两者三通道的PSNR、MSE、SSIM加权得到总的评价指标。基于稀疏表示的无参考型图像质量评价方法中首先通过小波变换得到图像的统计特征，利用统计特征构建特征字典，然后在该字典上对失真图像进行稀疏表示，将稀疏系数作为权值，利用字典图像的DMOS值得到测试图像的DMOS评价值。在LIVE II数据库图片的测试结果表明本文提出的两类模型效果良好。
本章参考文献
1.	王志明，自动化学报，无参考型图像质量评价综述，2016.6；
2.	褚江、陈强、杨曦晨，全参考性图像质量评价综述，计算机运用研究，2014.1；
3.	何立火，视觉信息质量感知模型及评价方法研究，博士学位论文，西安电子科技大学，2013
4.	Z. Wang and A. C. Bovik, Modern Image Quality Assessment. New York: Morgan and Claypool Publishing Company, 2006.
5.	S. Daly, “The visible difference predictor: An algorithm for the assessment of image fidelity”,in Digital Images and Human Vision, A. B. Watson, ed. Cambridge, MA: The MIT Press,179-206, 1993.
6.	J. Lubin, “A visual discrimination model for image system design and evaluation”, in Visual Models for Target Detection and Recognition, E. Peli, ed. Singapore, World Scientific, 207-220,1995.
7.	Z. Wang, A. C. Bovik, H. R. Sheikh, and E. P. Simoncelli, “Image quality assessment: from error visibility to structural similarity.” IEEE Trans. Image Processing, 13(4): 600-612, 2004.
8.	CHEN Guan-hao，YUNG Chun-ling，XIE Sheng-li Gradient-based structural similarity for image quality assessment // Pro of International Conference on image Processing.2006:2929-2932.
9.	H. R. Sheikh, A. C. Bovik, and G. D. Veciana, “An information fidelity criterion for image quality assessment using natural scene statistics.” IEEE Trans. Image Processing, 14(12):2117-2128, 2005.
10.	H. R. Sheikh, and A. C. Bovik, “Image information and visual quality.” IEEE Trans. Image Processing, 15(2): 430-444, 2006.
11.	Gao Xin-bo，Lu wen，TAO Da-cheng，et al. image quality assessment based on multiscale geometric analysis。IEEE Trans On Image Processing，2009,18（7）：1409-1423.
