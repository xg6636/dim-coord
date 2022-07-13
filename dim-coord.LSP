;;;; 坐标标注插件
;;;; 
;;;; created at 2021/12/25 15:20:47
;;;; last modified at 2022/07/13 20:25:01
;;;; 
;;;; copyright (c) 2021 - 2022 Jack Hsu 



(defun xg/get-points (/ pt1 pt2 ret) 
  ;; 获取用户输入的点坐标。
  (if (setq pt1 (getpoint "指定引线箭头的位置：")) 
    (if (setq pt2 (getpoint pt1 "\n指定引线基线的位置：")) 
      (setq ret (list pt1 pt2))))
  ret)

(defun xg/get-coord (pt yflag / od x y) 
  ;; 返回点坐标的字符串，形如x=***.***\ny=***.***。
  (if (/= 1 (setq od (getvar "dimzin"))) 
    (setvar "dimzin" 1))
  (setq x (rtos (car pt) 2 3)
        y (rtos (cadr pt) 2 3))
  (if (/= od (getvar "dimzin")) 
    (setvar "dimzin" od))
  (if yflag 
    (strcat "X=" y "\nY=" x)
    (strcat "X=" x "\nY=" y)))

(defun xg/dim-coord (pts yflag / oc) 
  ;; 主函数，调用command完成引线标注。
  (if pts 
    (progn 
      (if (/= 0 (setq oc (getvar "cmdecho"))) 
        (setvar "cmdecho" 0))
      (command "_.mleader" 
               (car pts)
               (cadr pts)
               (xg/get-coord (car pts) yflag))
      (if (/= oc (getvar "cmdecho")) 
        (progn 
          (setvar "cmdecho" oc)
          (princ))))))

(defun c:zbbz () 
  ;; 插件的命令入口，xy坐标互换。
  (xg/dim-coord (xg/get-points) t))

(defun c:zbbz2 () 
  ;; 插件的命令入口，xy坐标不互换。
  (xg/dim-coord (xg/get-points) nil))

(prompt "\n[坐标标注 v0.1.1] 已加载，启动命令：ZBBZ、ZBBZ2，ZBBZ互换XY坐标。作者：@徐工徐工，qq：120522448")
(princ)