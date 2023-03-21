
            var fileArray = [];
            var totalUploadedLength;
            var isLogin = 0;
            var isSleepMember = 0;

            window.onload = function () {
              var form = document.getElementById('writeForm');
              var sendBtn = document.getElementById('help_send');
              var fileInput = document.getElementById('help_upload');
              var cancelBtn = document.getElementById('help_cancel');
              var hOption = document.getElementById('hOption');
              var helpCategory = document.getElementById('help_category');
              var helpTextArea = document.getElementById('help_desc');
              var isContentWritten = false;
              // email 자동완성에서 이메일을 키보드로 선택하고 Enter 눌렀을 시 폼 전송 방지 //
              form.addEventListener('keydown', function (e) {
                if (e.target.id === 'help_email') {
                  if (e.key === 'Enter') {
                    e.preventDefault();
                  }
                }
              });
              form.help_email.addEventListener('keyup', function (e) {
                if (!(e.keyCode >= 37 && e.keyCode <= 40)) {
                  var regexp = /[[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi;
                  if (regexp.test(form.help_email.value)) {
                    form.help_email.value = form.help_email.value.replace(regexp, '');
                  }
                }
              });

              // 옵션 변경 시에 템플릿 변경 또는 내용 제거 //
              var previousOptionValue = 0;
              helpCategory.addEventListener('mousedown', function (e) {
                previousOptionValue = e.target.value;
              });
              // 옵션 변경 시에 템플릿 적용을 위한 이벤트 //
              helpCategory.addEventListener('change', function (e) {
                var hOption = document.getElementById('hOption');
                var helpCategory = document.getElementById('help_category');
                if (hOption.value !== '') {
                  if (confirm('"문의 종류" 를 변경하면, 작성하신 내용이 모두 지워집니다. 변경하시겠습니까?')) {
                    setTemplate(hOption, helpCategory);
                    hOption.value = this.value;
                  } else {
                    this.value = previousOptionValue;
                  }
                } else if (hOption.value === '') { // 파라미터 값으로 옵션 값이 안넘어오고, 문의 내역이 default 값일 때 //
                  setTemplate(hOption, helpCategory);
                  hOption.value = this.value;
                }
              });
              // content 작성 시에 빈칸 체크 //
              helpTextArea.addEventListener('keydown', function (e) {
                if (e.keyCode !== 32) {
                  isContentWritten = true;
                }
              });
              // 파라미터로 option 값 넘어 왔을 시에 템플릿 불러오기 //
              if (!!hOption.value) {
                setTemplate(hOption, helpCategory);
                if (hOption.value === '27') {
                  helpCategory.disabled = true;
                }
              }
              // 작성 취소 버튼 눌렀을 시 //
              cancelBtn.addEventListener('click', function () {
                if (confirm("작성한 내용이 모두 지워집니다. 정말로 취소 하시겠습니까?")) {
                  if (hOption.value === '27') {
                    window.close();
                  } else {
                    history.back(1);
                  }
                } else {
                  return false
                }
              });

              (function ($) {
                $(document).ready(function () {
                  loginCheckRedirect();
                  loginValidate();
                  var $upload_name = $('.uploads');
                  var filename = '';
                  var maxSize = 10 * 1024 * 1024;
                  var fileTarget = $('#help_upload');
                  fileTarget.on('change', function () { // 값이 변경되면
                    if (!this.files || this.files.length === 0) {
                      return;
                    }
                    if (this.files[0].size > maxSize) {
                      alert('첨부파일 용량은 최대 10Mbyte 넘을수 없습니다.');
                      return;
                    }
                    if (window.FileReader) { // modern browser
                      filename = $(this)[0].files[0].name;
                    } else { // old IE
                      filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
                    }
                    if (filename.length >= 25) {
                      var extPos = filename.lastIndexOf('.');
                      var subRest = filename.substring(15, extPos);
                      var fileExt = filename.substring(extPos);
                      var dotNotation = ' . . . . ';
                      filename = filename.substr(0, 10) + dotNotation + subRest + fileExt;
                    }
                    // 추출한 파일명 삽입


                    html = '<span class="info_upload">' +
                      ' <span class="txt_upload">' + filename + '</span>' +
                      '<button type="button" class="btn_delete btn_delete"><span class="blind">파일삭제</span></button>' +
                      '</span>';
                    $upload_name.html(html);
                  });


                  $(document).on('click', '.btn_delete', function () {
                    var agent = navigator.userAgent.toLowerCase();
                    $(this).parent().remove();
                    if (agent.indexOf("msie") != -1) {
                      $("#help_upload").replaceWith($("#help_upload").clone(true));
                    } else {
                      $("#help_upload").val("");
                    }
                  });
                });

              /*  function loginCheckRedirect() {
                  if (isLogin === 0 && confirm('로그인 후 문의하시면, 내 문의 내역에서 확인 가능합니다. 로그인 하시겠습니까?')) {
                    redirect_url = '/zf_user/login?url=' + $(location).attr('pathname') + "" + $(location).attr('search');
                    location.href = redirect_url;
                  }
                }*/

                function loginValidate() {
                  if (isLogin === 1 && isSleepMember !== 1) {
                    $('#help_email').attr('readonly', true);
                    $('#confirm_status').val('complete');
                    $('.btn_cert_pop').addClass('on');
                    $('#mail_confirm_complete').val('y');
                  }
                }
              })(jQuery);

              // 문의하기 버튼 눌렀을 시 //
              sendBtn.addEventListener('click', function (e) {
                e.preventDefault();
                var formData = {
                  email: form.help_email,
                  type: document.querySelectorAll('input[class^="help_member_type"]'),
                  category: form.help_category,
                  title: form.help_title,
                  content: form.help_desc,
                  files: form.help_upload,
                  agreeOn: form.agree_chk,
                  confirmStatus: form.confirm_status
                };
                var chkLength = 0;
                // 회원 구분 선택 여부 //
                var typeLength = formData.type.length;
                // 이메일 //
                if (isEmpty(formData.email.value)) {
                  alert('표시된 필수사항[이메일]을 입력 해 주세요.');
                  formData.email.focus();
                  return false;
                }

                if (emailCheck(formData.email.value.trim())) {
                  alert('이메일 주소를 다시 확인해주세요.');
                  formData.email.focus();
                  return false;
                }

                // 회원 구분 선택 여부 //
                for (var i = 0; i < typeLength; i++) {
                  if (formData.type[i].checked) {
                    chkLength++;
                  }
                }
                // 회원 구분 선택 여부 //
                if (chkLength === 0) {
                  alert('표시된 필수사항[구분]을 선택 해 주세요.');
                  return false;
                }
                // 문의종류//
                if (isEmpty(formData.category.value)) {
                  alert('표시된 필수사항[문의 종류]을 선택 해 주세요.');
                  formData.category.focus();
                  return false;
                }
                // 제목 //
                if (isEmpty(formData.title.value)) {
                  alert('표시된 필수사항[제목]을 입력 해 주세요.');
                  formData.title.focus();
                  return false;
                }
                // 내용 //
               /* if (isEmpty(formData.content.value) || !isContentWritten) {
                  alert('표시된 필수사항[내용]을 입력 해 주세요.');
                  formData.content.focus();
                  return false;
                }*/

   /*             if (formData.confirmStatus.value !== 'complete') {
                  alert('인증을 완료하세요.');
                  return false;
                }*/

                // 개인정보 수집 동의 체크박스 //
                if (!formData.agreeOn.checked) {
                  alert('개인정보 수집에 동의 하지 않으면 이용할 수 없습니다.');
                  formData.agreeOn.focus();
                  return false;
                }

               /* if (formData.confirmStatus.value !== 'complete') {
                  alert('인증을 완료하세요.');
                  return false;
                }*/

                // 확인 시에 전송 //
                if (confirm('문의하시겠습니까?')) {
                  form.help_category.disabled = false;
                  form.submit();
                } else {
                  return false;
                }
              });
              // 여기부터 이메일 자동 완성 //
              // 이메일 자동 완성 Elements //
              var email = {
                'listUl': document.querySelector('ul[class*="list_find"]'),
                'input': document.getElementById('help_email'),
                'recommendList': document.querySelectorAll('li[class^="auto_list"]'),
                'divSuggest': document.querySelector('div[class^="suggest_email"]')
              };
              // list item 안에 strong element //
              var inRecommendList;
              // 리스트 중 현재 포커스 중인 번호 //
              var order = 0;
              // 다른 곳 클릭시 none //

              email.input.addEventListener('blur', function (e) {
                jQuery('body').off('click').on('click', function (e) {
                  if (!jQuery(e.target).hasClass("auto_search")) {
                    email.divSuggest.style.display = 'none';
                  }
                });

                // if (e.target.id !== 'help_email') {
                //     email.divSuggest.style.display = 'none';
                // }
              });
              email.listUl.addEventListener('keyup', function (e) {
                if (e.target.id === 'help_email') {
                  if (email.input.value === '') {
                    return false;
                  } else {
                    email.divSuggest.style.display = 'inherit';
                    if (email.input.value.indexOf('@') > -1) {
                      email.divSuggest.style.display = 'none';
                    }

                    for (var i = 0; i < email.recommendList.length; i++) {
                      inRecommendList = email.recommendList[i].children[0].children[0];
                      inRecommendList.innerText = email.input.value;
                    }
                  }
                  if (e.keyCode === 38) {
                    if (order > 1 && order <= 5) {
                      --order;
                      email.recommendList[order].style.backgroundColor = 'white';
                      email.recommendList[order - 1].style.backgroundColor = 'lightgray';
                    }
                  }
                  if (e.keyCode === 40) {
                    if (order !== 0 && order <= 4) {
                      email.recommendList[order - 1].style.backgroundColor = 'white';
                      email.recommendList[order].style.backgroundColor = 'lightgray';
                      order++;
                    } else if (order === 0) {
                      email.recommendList[order].style.backgroundColor = 'lightgray';
                      order++;
                    }
                  }
                  if (e.key === 'Enter') {
                    e.preventDefault();
                    email.input.value = '';
                    email.input.value = email.recommendList[order - 1].innerText;
                    email.divSuggest.style.display = 'none';
                  }
                }
              });
              // 자동 완성 클릭 시 //
              email.divSuggest.addEventListener('click', function (e) {
                email.input.value = '';
                email.input.value = e.target.innerText;
                if (e.target.nodeName === 'STRONG') {
                  email.input.value = e.target.parentNode.innerText;
                }

                this.style.display = 'none';
              });

              // 여기까지 이메일 자동완성 //


            };

            function setFileDeleteBtn(files) {
              var deleteBtn = document.querySelectorAll('button[class^="btn_delete"]');
              var deleteBtnLength = deleteBtn.length;
              for (var i = 0; i < deleteBtnLength; i++) {
                deleteBtn[i].addEventListener('click', function (e) {
                  e.preventDefault();
                  // var thisFileNumber = this.dataset.file_number;
                  var thisFileNumber = e.target.getAttribute('data-file_number');
                  var findList = "span[data-file_number='" + thisFileNumber + "']";
                  var span = document.querySelector(findList);
                  // removeFile(files, thisFileNumber);
                  removeFileElement(thisFileNumber);
                  if (span !== null && span !== undefined) {
                    span.innerHTML = '';
                  }
                })
              }
            }

            function setTemplate(hOption, helpCategory) {

              var templateCompany =
                '원활한 상담을 위해 아래 정보를 입력해주세요.\n' +
                '- 기업명 / 공고 제목 :\n' +
                '- 공고 주소 :\n' +
                '- 신고 내용 :';
              var templateError =
                '원활한 상담을 위해 아래 정보를 입력해주세요.\n\n' +
                '- 운영체제(OS) : ex. 윈도우 7\n' +
                '- 브라우저 정보 : ex. 익스플로러 11\n' +
                '- 오류에 대한 설명 :\n\n' +
                '*오류 화면 캡쳐 첨부를 해주시면 더 빠르게 확인이 가능합니다.';

              var templateSiat =
                '원활한 상담을 위해 아래 정보를 입력해주세요.\n\n' +
                '- 발행을 원하는 인적성검사 쿠폰명, 쿠폰 갯수 : \n' +
                '(ex : 사람인 인적성검사 2건, 사람인 인성검사 3건)\n\n' +
                '* 동일 검사로 최대 3건까지만 발행 가능';
              var helpTextArea = document.getElementById('help_desc');
              if (parseInt(helpCategory.value) === 4 || hOption.value === 4) {
                helpTextArea.value = '';
                helpTextArea.value = templateCompany;
              } else if (parseInt(helpCategory.value) === 5 || hOption.value === 5) {
                helpTextArea.value = '';
                helpTextArea.value = templateError;
              } else if (parseInt(helpCategory.value) === 22 || hOption.value === 22) {
                helpTextArea.value = '';
                helpTextArea.value = templateSiat;
              } else {
                helpTextArea.value = '';
              }
            }

            function removeFile(files, fileNumber) {
              var length = files.size;

              for (var i = 0; i < length; i++) {
                var originFileNumber = parseInt(files[i].getAttribute('file_number'));
                var deleteFileNumber = parseInt(fileNumber);
                if (originFileNumber === deleteFileNumber) {
                  delete files[i];
                  removeFileElement(fileNumber);
                }
              }
              fileArray.forEach(function (v, i, a) {
                if (parseInt(a[i].file_number) === parseInt(fileNumber)) {
                  a.splice(i, 1);
                }
              });
            }

            function isTypeAllowable(file) {
              var allowableType =
                ['hwp', 'pdf', 'zip', 'xls', 'xlsx', 'jpg', 'gif', 'png', 'bmp', 'doc', 'docx', 'ppt', 'pptx'];
              var name = file;
              var dotPosition = name.lastIndexOf('.');
              var type = name.substr(dotPosition + 1).toLowerCase();

              if (allowableType.indexOf(type) !== -1) {
                return true;
              } else {
                alert('지원하지 않는 확장자 입니다.');
                return false;
              }

            }


            function removeFileElement(file_number) {
              var fileElem = document.querySelector("input[data-file_number='" + file_number + "']");
              fileElem.innerHTML = '';
              fileElem.setAttribute('type', 'hidden');
              fileElem.setAttribute('name', '');
            }


            function isSizeAllowable(file) {
              var total = 0;
              var equalNumber = 1000000;
              var size = (parseInt(file.size) / equalNumber);
              var totalSizeElem = document.getElementById('help_total_size');
              if (size > 10) {
                alert('첨부 용량을 초과하였습니다.');
                return false;
              }
              total += parseInt(size);
              fileArray.forEach(function (v, i, a) {
                total += a[i].size;
              });
              if ((total / equalNumber) > 10) {
                alert('첨부 용량을 초과하였습니다.');
                return false;
              }

              totalSizeElem.value = parseInt(total);
              return true;
            }

            function isEmpty(elementValue) {
              if (elementValue.trim() === '') {
                return true;
              } else {
                return false;
              }
            }



/*
            function loginCkeckRedirect() {
              if (isLogin === 0 && confirm('로그인 후 문의하시면, 내 문의 내역에서 확인 가능합니다. 로그인 하시겠습니까?')) {
                redirect_url = '/zf_user/login?url=/zf_user/help/inquery/email-inquiry-write?option=' + option;
                location.href = redirect_url;
              }
            }*/

            function emailCheck(email) {
              if (!/^[0-9a-z._+-]+@([0-9a-z_-]+\.)+[a-z]{2,10}$/i.test(email)) {
                return true;
              }
              return false;
            }