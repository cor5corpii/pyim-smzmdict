;;; pyim-smzmdict.el --- Strange scheMas of ZhengMa dict for pyim

;; Author: Yue Shi (Zhizhi), Zheng Yili
;; Maintainer: Yuanchen Xie <xieych@outlook.com>
;; Version: 0.1.1
;; Package-Requires: ((pyim "5.3.4"))
;; Homepage: https://github.com/cor5corpii/pyim-smzmdict
;; Keywords: convenience, pyim, Chinese, zhengma

;;; License:

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;; # pyim-smzmdict README #
;;
;; ## 简介 ##
;;
;; There are some modified Zhengma schemas that meet users' strange demands. This project originated from one of the aforementioned schemas, which is based on pyim for implementation.
;;
;; The first version only included the Sanma(triple) Zhengma. Now, the dict of the normal Zhengma has been added. The next step is to add a schema dict that distinguishes between simplified and traditional Chinese character roots.
;;
;; User needs to install [Pyim](https://github.com/tumashu/pyim) before using this package!
;;
;; 这是适用于 pyim 的郑码词库文件，请先安装 pyim 并进行配置后使用。
;;
;; 本词库最初为三码郑码(至至)创建，故名smzmdict，现已加入普通郑码词库，
;; 计划加入其他方案，以原本为Zheng码，此为邪，更名Strange scheMas of
;; ZhengMa.
;;
;; 三码郑码的原始数据由原作者至至本人提供，可用于非盈利性的交流、分享与使用。
;; 普通郑码词库来自于[rime-zhengma](https://github.com/acevery/rime-zhengma)项目。
;;
;; ## 安装和使用 ##
;;
;; 1. 下载 pyim 及本词库到 Emacs 可读取的位置；
;; 2. 在emacs配置文件中（比如: ~/.emacs）添加如下代码：
;;
;;   ``` emacs-lisp
;;   (require 'pyim-smzmdict)
;;   ;; 启用普通郑码
;;   (setq pyim-default-scheme 'nmzm)
;;   (pyim-nmzmdict-enable)
;;   ;; 启用三码郑码
;;   (setq pyim-default-scheme 'smzm)
;;   (pyim-smzmdict-enable)
;;   ```
;;
;; 3. M-x 之后调用 toggle-input-method 函数，回车开始使用。
;;
;;; Code:
;; * 代码                                                               :code:
(require 'pyim)

(pyim-scheme-add
 '(nmzm
   :document "郑码输入法。"
   :class xingma
   :first-chars "abcdefghijklmnopqrstuvwxyz"
   :rest-chars "abcdefghijklmnopqrstuvwxyz'"
   :code-prefix "nmzm/"
   :code-prefix-history ("_")
   :code-split-length 5
   :code-maximum-length 5
   :prefer-triggers nil))

;;;###autoload
(defun pyim-nmzmdict-enable ()
  "Add NorMal zhengma dict to pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "pyim-smzmdict.el")))
         (file (concat dir "pyim-nmzmdict.pyim")))
    (when (file-exists-p file)
      (if (featurep 'pyim)
          (pyim-extra-dicts-add-dict
           `(:name "nmzmdict-elpa" :file ,file :elpa t))
        (message "pyim 没有安装，pyim-nmzmdict 启用失败。")))))

(pyim-scheme-add
 '(smzm
   :document "三码郑码输入法。"
   :class xingma
   :first-chars "abcdefghijklmnopqrstuvwxyz"
   :rest-chars "abcdefghijklmnopqrstuvwxyz'"
   :code-prefix "smzm/"
   :code-prefix-history ("_")
   :code-split-length 3
   :code-maximum-length 3
   :prefer-triggers nil))

;;;###autoload
(defun pyim-smzmdict-enable ()
  "Add sanma(triple) zhengma dict to pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "pyim-smzmdict.el")))
         (file (concat dir "pyim-smzmdict.pyim")))
    (when (file-exists-p file)
      (if (featurep 'pyim)
          (pyim-extra-dicts-add-dict
           `(:name "smzmdict-elpa" :file ,file :elpa t))
        (message "pyim 没有安装，pyim-smzmdict 启用失败。")))))

;; * Footer

(provide 'pyim-smzmdict)
;;; pyim-smzmdict.el ends here
