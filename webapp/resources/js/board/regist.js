var QUESTION = {};

(function ($) {
    var Regist = function () {
        this.wrapQnaPanel = $('.company_honest_qna');
        this.searchCompanyWrap = $('#panel_section_contents .company_search_panel .layer_search_keyword');
        this.boxCategory = $('.box_qna_category');
        this.induceTag = '';
        this.isUploading = false;
    };

    var Company = {
        name: '검색어',
        inputText: $('#input_company_nm'),
        searching: null,
        searchingTimeout: 200,
        setSearchParams: function (searchKeyword, csn) {
            this.setResult(searchKeyword, csn);
        },

        searchCompanyNm: function (text) {
            if (text === '') {
                $('.wrap_auto_complete_keyword').hide();
                return;
            }
            var _self = this;

            _self.validation(text);

            if (_self.searching) {
                clearTimeout(_self.searching);
            }

            _self.searching = setTimeout(function () {
                $.ajax({
                    url: '/zf_user/member/resume-api/get-career-company-list',
                    method: 'get',
                    dataType: 'json',
                    data: {'seed': text}
                }).done(function (data) {
                    $('.wrap_auto_complete_keyword').show();
                    _self.setAutoCompleteList(data);
                    _self.registerEvent();
                });

            }, _self.searchingTimeout);
        },

        validation: function (text) {
            if (text.length === 0) {
                return QUESTION.Regist.searchCompanyWrap.find('ul.txt_list li').remove();
            }

            if (text.length >= 1) {
                var regExp = /['"‘“!^@*~:;`\\]/gi;
                if (regExp.test(text)) {
                    this.inputText.val(this.inputText.val().replace(regExp, ''));
                    alert('검색어에 \' " ‘ “ ! ^ @ * ~ : ; ` \\ 와 같은 특수문자는 입력 할 수 없습니다.');
                }
            }
        },

        setAutoCompleteList: function (companyList) {
            var companyListWrap = QUESTION.Regist.searchCompanyWrap.find('ul.auto_complete');
            companyListWrap.empty();

            if (companyList.length === 0) {
                companyListWrap.append('<div class="tit"><p class="txt_nodata" style="display: block">일치하는 회사명이 업습니다.</p></div>');
                return;
            }

            for (var i = 0; i < companyList.length; i++) {
                companyListWrap.append('<li><button type="button" class="btn_keyword" data-value="' + companyList[i].csnTotal + '" data-name="' + companyList[i].companyNm + '">' + companyList[i].matchCompanyNm + '<span class="address">' + companyList[i].address + '</span></button></li>');
            }

            QUESTION.Regist.searchCompanyWrap.find('.wrap_scroll').data('plugin_tinyscrollbar').update();

        },

        registerEvent: function () {
            QUESTION.Regist.searchCompanyWrap.find('.btn_keyword').on('click', function () {
                Company.setResult($(this).data('name'), $(this).data('value'));
            });
        },

        setResult: function (companyName, csn) {
            if(!companyName) {
                return false;
            }
            this.inputText.val(companyName);
            $('#csn').val(csn);
            $('#company_nm').val(companyName);
            $('#selected_company_label').addClass('selected').text(companyName);
            $('#dimmed').hide();
            $('.company_search_panel').removeClass('on');
            // $('.wrap_auto_complete_keyword').hide();
        }

    };

    var Hashtag = {
        name: '해시태그',
        tags: [],
        mainHashTag: '',
        container: $('#tag-list'),
        input: $('#tag_input'),
        iptLayer: $('.ipt_layer'),
        prevText: '',
        registEvent: function() {
            var _self = this;
            $(document).on('click', '.btn_tag_del', function() {
                _self.remove($(this).data('index'));
            });

            this.input.on('keydown', function() {
                _self.prevText = $(this).val().trim();
            });

            this.input.on('keyup', function(e) {
                var value                     = $(this).val().trim(),
                    listLayer                 = _self.iptLayer,
                    $autoCompleteListTemplate = $('#autoCompleteListTemplate').html();

                if (e.keyCode === 13 && value !== '') {
                    _self.addAndClearAutoList(value);
                    return;
                }

                if (e.keyCode === 8 && value === '' && _self.prevText === '') {
                    _self.remove();
                    _self.clearAutoList();
                    return;
                }

                if (value === '') {
                    listLayer.removeClass('on');
                    return;
                }

                var html   = '';
                var regExp = MakeRegex.getRegExp(value);
                for (var checkIndex in jobCategoryAndInterestList) {
                    var checkItem = jobCategoryAndInterestList[checkIndex];
                    if (!regExp.test(checkItem)) {
                        continue;
                    }
                    var markKeyord = _self.getMarkKeyword(regExp, checkItem);
                    html          += $autoCompleteListTemplate.replace("{{text}}", markKeyord);
                }

                if (html.length > 0) {
                    listLayer.find('.list').html(html);
                    listLayer.find('.area_direct .txt_point').text('"'+value+'"');
                    if (!listLayer.hasClass('on')) {
                        listLayer.addClass('on');
                    }
                } else {
                    _self.clearAutoList();
                }
            });

            this.input.on('blur', function() {
                if (_self.iptLayer.hasClass('on')) {
                    return;
                }

                var value = $(this).val().trim();
                if (value !== '') {
                    _self.add(value);
                }
            });

            this.iptLayer.on('click', '.list li', function() {
                var value = $(this).find('button').text().trim();
                _self.addAndClearAutoList(value);
            });

            this.iptLayer.on('click', '.area_direct button', function() {
                var value = $(this).find('span').text().trim().replace(/\"/g, '');
                _self.addAndClearAutoList(value);
            });
        },
        setMainHashTag: function(tag) {
            this.mainHashTag = tag;
            if (this.tags.indexOf(tag) > -1) {
                this.tags.splice(this.tags.indexOf(tag), 1);
                this.tags.unshift(tag);
            }
            Hashtag.draw();
        },
        add: function(tag) {
            this.input.val('');
            tag = tag.replace(/#/g, '');
            if (!this.validation(tag)) {
                return;
            }
            this.tags.push(tag);
            this.draw();
        },
        isExistMainHashTag: function(){
         return this.mainHashTag.length > 0;
        },
        remove: function(index) {
            if (this.isExistMainHashTag() && this.tags.length <= 1) {
                return;
            }
            if (index) {
                Hashtag.tags.splice(index, 1);
            } else {
                Hashtag.tags.pop();
            }
            Hashtag.draw();
        },
        draw: function() {
            var _self = this;
            var result = '';

            this.tags.forEach(function(str, index) {
                var invisibleDeleteButton = (_self.mainHashTag.length > 0 && index == 0);
                result += '<li class="tag_item"> <div class="tag">'
                  + str
                  + (invisibleDeleteButton ? '' : ('<button type="button" class="btn_tag_del" data-index="' + index + '"><span class="blind">태그 삭제</span> </button>'))
                  +'</div> </li>';
            });
            this.container.html(result);
            this.visibleTagInput();
        },
        visibleTagInput: function() {
            var elem = $('.box_tag_input');
            if (Hashtag.tags.length >= 5) {
                elem.hide();
            } else {
                elem.show();
            }
        },
        changeMainTag: function(tag) {
            Hashtag.mainHashTag = tag;
            Hashtag.tags = [];
            Hashtag.add(tag);
            Hashtag.draw();
        },
        validation: function(tag) {
            if (tag.trim().length === 0) {
                return false;
            }
            if (this.tags.indexOf(tag) > -1) {
                return false;
            }
            if (this.tags.length >= 5) {
                alert('해시태그 키워드는 #을 붙여 5개까지 작성 가능합니다.');
                return false;
            }
            if (tag.length > 30) {
                alert('해시태그 키워드 1개당 30자 초과 글자수는 입력하실 수 없습니다.');
                return false;
            }
            if(QUESTION.Regist.checkEmoji(tag)){
                alert('해시태그에는 이모지를 입력하실 수 없습니다.');
                return false;
            }
            var hashTagSpecial = /[\{\}\[\]?.,;:|*~`!^\-+@\$%\\\=\'\"]/g;
            if (tag.match(hashTagSpecial)) {
                alert('앗! ' + tag + '에 "#","_","&","/","(",")" 외에는 사용하실 수 없습니다ㅠㅠ');
                return false;
            }
            return true;
        },
        // 자동완성시 mark 처리
        getMarkKeyword: function (regExp, value) {
            var matchArr = value.match(regExp);
            if (!matchArr) {
                return value;
            }

            var uniqueArr = matchArr.filter(function (item, pos) {
                return matchArr.indexOf(item) === pos;
            });

            var markKeyword = value;
            for (var i = 0; i < uniqueArr.length; i++) {
                markKeyword = markKeyword.replace(new RegExp(MakeRegex.escapeRegExp(uniqueArr[i]), "g"), 'ⓢ' + uniqueArr[i] + 'ⓔ');
            }
            markKeyword = markKeyword.replace(/ⓢ/g, '<em>').replace(/ⓔ/g, '</em>');

            return markKeyword;
        },
        clearAutoList: function () {
            this.iptLayer.find('.list').empty();
            this.iptLayer.find('.area_direct .txt_point').text('');
            this.iptLayer.removeClass('on');
        },
        addAndClearAutoList: function (value) {
            if (value !== '') {
                this.add(value);
                this.clearAutoList();
            }
        }
    };

    Regist.prototype = {

        init: function () {
            $('.wrap_scroll').tinyscrollbar();

            this.registerEvent();
            this.renderLayer();
        },

        hashTagInit: function(mainTag, tag) {
            Hashtag.registEvent();

            if (typeof tag === 'string') {
                Hashtag.add(tag);
            } else {
                tag.forEach(function(t) {
                    Hashtag.add(t);
                });
            }
            if (mainTag) {
                Hashtag.setMainHashTag(mainTag);
            }
        },

        registerEvent: function () {
            let isSubmit = false;

            this.searchCompanyWrap.on('keyup focus change', '#input_company_nm', function () {
                Company.searchCompanyNm($(this).val());
            });

            this.wrapQnaPanel.on('click', '.btn_qna_write', function () {
                if (isSubmit === true) {
                    return false;
                }

                var f = document.review_qust_form;
                var vaildationCheck = QUESTION.Regist.validationCheck(f);

                if (vaildationCheck[0] === 'fail') {
                    $('#alert_text').text(vaildationCheck[1]);
                    $('#dimmed').show();
                    $('.layer_qna_alert').show();
                    return;
                }

                if ($('input:checkbox[id="all"]').is(":checked")) {
                    $('#csn').val('');
                    $('#job_category_cd').val('');
                }

                $('#question_detail').val($('#qust_detail').html());
                $('#hash_tag').val('#' + Hashtag.tags.join('#'));
                $('#main_hash_tag').val(Hashtag.mainHashTag);

                isSubmit = true;
                QUESTION.Regist.induceTag = '';
                var url = '/zf_user/company-review-qst-and-ans/qst-insert-ajax';
                $(f).ajaxForm({
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    success: function (result) {
                        if (result.result === 'success') {
                            if (result.qust_idx) {
                                $('#insert_qust_idx').val(result.qust_idx);
                            }
                            $('#dimmed').show();

                            var $layer = $('.qna_confirm_complete');
                            // 질문 내용에 마스킹한 개인정보가 있는 경우
                            if (result.privacy_masking_text) {
                                alert('개인정보가 포함된 게시글은 등록하기 어렵습니다.\n' + result.privacy_masking_text + ' 으로 변경하여 게시글을 등록하겠습니다.');
                            }
                            if (result.induce_tag && result.induce_tag.hashtag_nm) {
                                $('.induceTagText').text(result.induce_tag.hashtag_nm);
                                QUESTION.Regist.induceTag = result.induce_tag.hashtag_nm;
                                $('.qna_confirm_complete_induce_tag').show();
                                return;
                            }
                            $layer.show();
                        } else if (result.result === 'fail') {
                            $('#dimmed').show();
                            $('#alert_text').html(result.msg);
                            $('.layer_qna_alert').show();
                            isSubmit = false;
                        }
                    },
                    error: function (error) {
                        alert('오류가 발생하였습니다.');
                        console.log(error);
                    }
                }).submit();
            });

            $('input:checkbox[name="ask"]').on('click', function () {
                switch ($(this).attr('id')) {
                    case 'all':
                        if ($(this).is(":checked")) {
                            QUESTION.Regist.gaEvent('qst_register', 'all_ans');
                            $('input:checkbox[id="selected_job"]').prop("checked", false);
                            $('input:checkbox[id="company"]').prop("checked", false);
                            $('.company_search_panel').removeClass('on');
                            $('.job_category_section').removeClass('on');
                            $('#csn').val('');
                            $('#job_category_cd').val('');
                            $('#selected_job_label').text('직무 경력자분들과 이야기할래요');
                            $('#selected_company_label').text('기업 경력자분들과 이야기할래요');
                        } else {
                            $('input:checkbox[id="selected_job"]').prop("checked", true);
                            $('input:checkbox[id="company"]').prop("checked", true);
                            $('.job_category_section').addClass('on');
                        }
                        break;
                    case 'selected_job':
                        if ($(this).is(":checked")) {
                            QUESTION.Regist.gaEvent('qst_register', 'job_ans');
                            $('input:checkbox[id="all"]').prop("checked", false);
                            $('.company_search_panel').removeClass('on');
                            $('.job_category_section').addClass('on');
                        } else {
                            if (!$(this).is(":checked") && !$('input:checkbox[id="company"]').is(":checked")) {
                                $('.company_search_panel').removeClass('on');
                                $('.job_category_section').removeClass('on');
                                $('input:checkbox[id="all"]').prop("checked", true);
                            }
                            $('.job_category_section').removeClass('on');
                            $('.list_auto_search').hide();
                            $('#job_category').val('');
                            $('#job_category_cd').val('');
                            $('#selected_job_label').text('직무 경력자분들과 이야기할래요');
                        }
                        break;
                    case 'company':
                        if ($(this).is(":checked")) {
                            QUESTION.Regist.gaEvent('qst_register', 'company_ans');
                            $('input:checkbox[id="all"]').prop("checked", false);
                            $('.job_category_section').removeClass('on');
                            $('.company_search_panel').addClass('on');
                        } else {
                            if (!$(this).is(":checked") && !$('input:checkbox[id="selected_job"]').is(":checked")) {
                                $('.company_search_panel').removeClass('on');
                                $('.job_category_section').removeClass('on');
                                $('input:checkbox[id="all"]').prop("checked", true);
                            }
                            $('.company_search_panel').removeClass('on');
                            $('#input_company_nm').val('');
                            $('.wrap_auto_complete_keyword').hide();
                            $('#csn').val('');
                            $('#selected_company_label').text('기업 경력자분들과 이야기할래요');
                        }
                        break;
                }
            });

            $('.qna_confirm_complete_induce_tag .btn_save').on('click', function() {
                var tag = QUESTION.Regist.induceTag.replace(/#|\s/g, '');
                location.href = '/zf_user/company-review-qst-and-ans/registration_question?hashtag=' + encodeURIComponent(tag);
            });

            $('.btn_layer_close').on('click', function () {
                var parentsId = $(this).parents().attr('id');
                $('#dimmed').hide();
                $('#' + parentsId).hide();
            });

            $('#layer_qna_alert .btn_confirm').on('click', function () {
                $('#dimmed').hide();
                $('#layer_qna_alert').hide();
            });

            $('.qna_reg_complete_layer_close').on('click', function () {
                var targetQustIdx = $('#insert_qust_idx').val();
                var edit_mode = $('input:hidden[name="edit_mode"]').val();
                if (edit_mode === 'y') {
                    targetQustIdx = $('input[name="edit_qust_idx"]').val();
                }
                if (targetQustIdx) {
                    location.href = '/zf_user/company-review-qst-and-ans/detail-page?qust_idx=' + targetQustIdx;
                } else {
                    location.href = '/zf_user/company-review-qst-and-ans';
                }
            });

            $('#qst_title').on('keyup', function() {
                QUESTION.Regist.checkLengthTitle($(this).val());
            });

            $('#qust_detail').on('click', function () {
                  $(this).attr('contenteditable', true);
              })
              .on('keyup keydown', function(e) {
                  if ((e.ctrlKey || e.metaKey) && ['u', 'b'].indexOf(e.key) > -1) {
                      return false;
                  }
                  var text = $(this).text();
                  QUESTION.Regist.updateLength(text.length);
              })
              .on('dragover', function(e) {
                  e.stopPropagation();
                  e.preventDefault();
              })
              .on('drop', function(e) {
                  e.preventDefault();
                  var files = e.originalEvent.dataTransfer.files;
                  QUESTION.Regist.imageUpload(files);
              })
              .on('paste', function(e) {
                  e.stopPropagation();
                  e.preventDefault();
                  var text = '';
                  if (e.originalEvent.clipboardData) {
                      text = e.originalEvent.clipboardData.getData('text/plain');
                  } else { // for IE
                      text = window.clipboardData.getData('Text');
                  }
                  if (document.queryCommandSupported('insertText')) {
                      document.execCommand('insertText', false, text);
                  } else { // for IE
                      document.execCommand('paste', false, text);
                  }

                  QUESTION.Regist.updateLength($(this).text().length);
              });

            $('#image_add').on('change', function(e) {
                QUESTION.Regist.gaEvent('qst_register', 'image_q');
                var files = e.target.files || e.dataTransfer.files;
                QUESTION.Regist.imageUpload(files);
            });

            $('.company_search_panel_close').on('click', function () {
                $('.company_search_panel').removeClass('on');
            });

            $('.inform_layer_close').on('click', function () {
                $('#dimmed').show();
                if (document.referrer) {
                    history.back();
                } else {
                    location.href = '/zf_user/company-review-qst-and-ans';
                }
            });

            this.boxCategory
              .on('blur', '.btn_category_select', function() {
                  $(this).removeClass('expend');
              })
              .on('click', '.btn_category_select', function() {
                  QUESTION.Regist.gaEvent('qst_register', 'categ_tag');
                  $(this).toggleClass('expend');
              })
              .on('mousedown', '.category', function() {
                  $('.btn_category_select').text($(this).text());

                  var type = $(this).data('type');
                  var name = $(this).data('name');
                  var upperName = $(this).data('upper_name');

                  $('#category_type').val(type);
                  Hashtag.changeMainTag(name);
                  Hashtag.add(upperName);

                  // 콕 집어 이야기하기
                  var qnaElem = $('#panel_section_contents');

                  qnaElem.show();
                  // 꼭 집어 말하기 초기화 (모든 분들과 할래요 선택)
                  if (!$('#all:checked')[0]) {
                      $('#all').trigger('click');
                  }
                });
        },

        imageUpload: function(files) {
            if (files.length === 0) { // IE를 위한 코드 chnage 두번 발생
                return;
            }
            if (QUESTION.Regist.isUploading) {
                alert('이미지 업로드 중 입니다. 잠시 후 다시 시도해 주세요.');
                return;
            }
            var imgs = $('#qust_detail').find('img');
            if (files.length > 5 || imgs.length > 4 || (imgs.length + files.length) > 5) {
                alert('이미지는 최대 5장까지 첨부 가능합니다.');
                $('#image_add').val(''); // 초기화
                return;
            }
            var validatedFiles = this.imageUploadValidation(files);
            if (validatedFiles.length === 0) {
                $('#image_add').val(''); // 초기화
                return;
            }
            var formData = new FormData();
            for (var i = 0; i < validatedFiles.length; i++) {
                formData.append('images[]', validatedFiles[i]);
            }

            QUESTION.Regist.isUploading = true;
            $.ajax({
                url: '/zf_user/company-review-qst-and-ans/image-upload',
                method: 'post',
                data: formData,
                processData: false,
                contentType: false,
                dataType: 'json',
                success: function(res) {
                    if (res.result !== 'success') {
                        alert(res.message);
                        return;
                    }
                    if (res.data.length === 0) {
                        alert('파일첨부에 실패하였습니다. jpg, gif, png 파일로 2MB이하 파일만 첨부할 수 있습니다.');
                        return;
                    }
                    res.data.forEach(function(item) {
                        var imageContainer = document.createElement('div');
                        imageContainer.classList.add('editor_img');
                        var img = new Image();
                        img.src = item.url;
                        img.dataset.name = item.upload_name;
                        imageContainer.appendChild(img);
                        $('.editor_wrap').append(imageContainer);
                    });
                    QUESTION.Regist.isUploading = false;
                },
                error: function(err) {
                    if (err.result === 'fail' && err.message) {
                        alert(err.message);
                    }
                    QUESTION.Regist.isUploading = false;
                },
            })
            $('#image_add').val(''); // 초기화
        },

        imageUploadValidation: function (files) {
            var validatedFiles = [];
            var alertText = false;
            for (var i = 0; i < files.length; i++) {
                var allowExtensionTypes = /jpg|jpeg|png|gif/i;
                // type은 image/jpeg로 확인되어 name에서 체크
                if (files[i].name.lastIndexOf('.jfif') > -1) {
                    alertText = true;
                    continue;
                }
                if (files[i].type.search(allowExtensionTypes) < 0) {
                    alertText = true;
                    continue;
                }
                var $maxFileSize = 2097152;
                if (parseInt(files[i].size, 10) >= $maxFileSize) {
                    alertText = true;
                    continue;
                }
                validatedFiles.push(files[i]);
            }
            if (alertText) {
                alert('파일첨부에 실패하였습니다. jpg, gif, png 파일로 2MB이하 파일만 첨부할 수 있습니다.');
            }
            return validatedFiles;
        },

        checkEmoji: function (keyword) {
            var emojiRegExr = /(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/g;
            return emojiRegExr.test(keyword);
        },

        renderLayer: function () {
            QUESTION.Regist.updateLength($('#qust_detail').text().length);
            if ($('.layer_black_list_info').length > 0) {
                var blackTimer = setInterval(function () {
                    $('#dimmed').show();
                    $('.layer_black_list_info').show();
                    $('html, body').animate({scrollTop: 0}, 400);
                    clearInterval(blackTimer);
                }, "500");
            }

            /*
                콕 집어 이야기하기 > 게시글 수정일경우는 보여주면 안된다
            */
            var isEditMode = $('input:hidden[name="edit_mode"]').val() === 'y';

            if (!isEditMode) {
                $('#panel_section_contents').show();
            }
        },

        updateLength: function (len) {
            var $number = $('.qna_input_bottom').find('.post_count');
            $number.html('<em>' + len + '</em>/5000자');
        },

        checkLengthTitle: function(ju) {
            if (ju.length > 50) {
                alert('게시글 제목은 50자 까지만 입력 가능합니다! 혹시 조금만 줄여주시겠어요..?ㅎㅎ');
                $('#qst_title').val(ju.substring(0, 50));
            }
        },

        validationCheck: function (f) {
            var special = /[<>]/g;
            if (f.qst_title.value.trim() == '') {
                return ['fail', '앗! 게시글 제목 입력하고 작성 완료해주세요!'];
            }

            if (f.qst_title.value.length > 50) {
                return ['fail', '게시글 제목은 50자까지 입력 가능합니다.'];
            }

            if (f.qst_title.value.trim().match(special)) {
                return ['fail', '앗! 제목에는 \'<>\' 문자는 사용할 수 없습니다ㅠㅠ'];
            }

            if(this.checkEmoji(f.qst_title.value)){
                return ['fail', '앗! 게시글 제목에는 이모지를 사용할 수 없습니다ㅠㅠ'];
            }

            var content = $('#qust_detail').text();
            if (content.trim() === '') {
                return ['fail', '앗! 게시글 내용 입력하고 작성 완료해주세요!'];
            }

            if (content.length > 5000) {
                return ['fail',  '게시글 내용은 5000자까지 입력 가능합니다.'];
            }

            if (content.match(special)) {
                return ['fail', '앗! 게시글 내용에는 \'<>\' 문자는 사용할 수 없습니다ㅠㅠ'];
            }

            if (Hashtag.tags.length === 0) {
                return ['fail', '앗! 게시글 해시태그를 입력하고 작성완료해주세요!'];
            }

            // 직종 체크인데 직종이 없을 경우
            if ($('input:checkbox[id="selected_job"]').is(":checked")) {
                if ($('#job_category_cd').val().length === 0) {
                    $('.job_category_section').addClass('on');
                    return ['fail', '앗! 어떤 직무의 경력자에게 답변을 받고싶은지 직무를 선택해주세요'];
                }
            }

            // 기업명 체크인데 기업명이 없는 경우
            if ($('input:checkbox[id="company"]').is(":checked")) {
                if ($('#csn').val().length === 0 || $('#company_nm').val().length === 0) {
                    $('.company_search_panel').addClass('on');
                    return ['fail', '앗! 어떤 기업의 경력자에게 답변을 받고싶은 지 기업을 선택해주세요'];
                }
            }

            return ['success'];
        },

        gaEvent: function (flow, label) {
            try {
                n_trackEvent('qst_and_ans', flow, label, '');
            } catch (e) {

            }
            try {
                dataLayer.push({
                    'event': 'ga_lead',
                    'category': 'qst_and_ans',
                    'event-flow': flow,
                    'event-label': label
                });
            } catch (e) {

            }
        },

    };

    QUESTION.Regist = new Regist();

    document.addEventListener("DOMContentLoaded", function () {
        QUESTION.Regist.init();
    }, false);

}(jQuery));