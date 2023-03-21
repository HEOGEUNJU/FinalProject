var DETAILPAGE = {}, params = params;

(function ($) {
    var Detail = function () {
        this.qnaAnswerBox = $('.qna_answer_form');
        this.qnaAnswerReplyBox = $('#qna_answer_box');
    };

    Detail.prototype = {
        init: function () {
            this.registerEvent();
            var tooltipHide = function(){
                clearInterval(tooltipTimer);
                $('.post_view_wrap .toolTip').hide();
            };
            tooltipTimer = setInterval(tooltipHide,5000);
        },

        registerEvent: function () {
            var _self = this;
            $('.btnClose').on('click', function () {
                $('#dimmed').hide();
                $('.modalWrap').hide();
            });

            $(document).on('click', '.toolTip .btnClose', function() {
                $(this).closest('.toolTip').hide();
            });

            this.qnaAnswerBox.on('keyup paste', '#contents', function () {
                DETAILPAGE.Detail.checkLength($(this).val(), 1000, 'answer')
            });

            $('#thanks_card_contents').on('keyup', function () {
                DETAILPAGE.Detail.checkLength($(this).val(), 60, 'thanks_card')
            });

            this.qnaAnswerBox.on('click', '.btn_anwr_register', function () {
                var submit = [];
                var f = document.qna_answer_form;
                var contents = $('#contents').val();
                var special = /[<>]/g;

                if (contents.trim() === '') {
                    alert('입력된 댓글 내용이 없습니다!');
                    return;
                }
                if (contents.match(special)) {
                    alert('앗! 댓글 내용에는 \'<>\' 문자는 사용할 수 없습니다ㅠㅠ');
                    return;
                }
                if (_self.checkEmoji(contents)) {
                    alert('앗! 댓글 내용에는 이모지를 사용할 수 없습니다ㅠㅠ');
                    return;
                }
                if (!window.confirm('댓글을 등록 하시겠습니까?')) {
                    return;
                }

                var url = '/zf_user/company-review-qst-and-ans/registration-anwr';
                $(f).ajaxForm({
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    success: function (result) {
                        if (result.status === 'success') {
                            alert(result.msg.replace('\<br\>', '\n'));
                            location.reload();
                        } else if (result.result === 'fail') {
                            alert(result.msg);
                        }
                    },
                    error: function (error) {
                        alert('오류가 발생하였습니다.');
                        console.log(error);
                    }
                }).submit();
            });

            this.qnaAnswerReplyBox.on('click', '.btn_reply_register', function () {
                var qustIdx     = $(this).data('qust_idx'),
                    uperAnwrIdx = $(this).data('uper_anwr_idx'),
                    callMemIdx  = $(this).data('call_mem_idx'),
                    contents    = $('#reply_contents_' + uperAnwrIdx).val();

                if (contents.trim() === '') {
                    alert('입력된 대댓글 내용이 없습니다!');
                    return;
                }
                var special = /[<>]/g;
                if (contents.match(special)) {
                    alert('앗! 대댓글 내용에는 \'<>\' 문자는 사용할 수 없습니다ㅠㅠ');
                    return ;
                }
                if (_self.checkEmoji(contents)) {
                    alert('앗! 대댓글 내용에는 이모지를 사용할 수 없습니다ㅠㅠ');
                    return;
                }
                if (qustIdx == '' || uperAnwrIdx == '') {
                    alert('오류가 발생하였습니다.');
                    return;
                }
                if ($(this).siblings('.comment_write').attr('data-reply-to') != '' && callMemIdx == '') {
                    alert('오류가 발생하였습니다.');
                    return;
                }

                if(!confirm('대댓글을 등록 하시겠습니까?')) return;
                if ($('#list_reply_' + uperAnwrIdx).parents('.list_reply').hasClass('open') || !!$('#answer_reply_more_' + uperAnwrIdx)) {
                    $.ajax({
                        url: '/zf_user/company-review-qst-and-ans/registration-reply',
                        method: 'post',
                        dataType: 'json',
                        data: {
                            'contents' : contents,
                            'qust_idx' : qustIdx,
                            'uper_anwr_idx' : uperAnwrIdx,
                            'call_mem_idx' : callMemIdx,
                        },
                        success: function (response) {
                            if (response.status === 'success') {
                                // 댓글,대댓글 카운트 증가
                                var qnaReply = $('.qna_info.qna_reply');
                                var countTag = $('#list_reply_' + uperAnwrIdx).parents('li').find('.comment_data strong');
                                _self.increaseCount(countTag);
                                _self.increaseCount(qnaReply);

                                $('#reply_contents_' + uperAnwrIdx).val('');
                                $('#list_reply_' + uperAnwrIdx).html('');
                                $('#list_reply_' + uperAnwrIdx).html(response.html);
                                $('#list_reply_' + uperAnwrIdx).parents('.list_reply').addClass('open');
                                $('#answer_reply_more_' + uperAnwrIdx).html('<span class="less">대댓글 숨기기</span>');
                                if (response.privacy_text_msg) {
                                    alert(response.privacy_text_msg.replace('\<br\>', '\n'));
                                }
                            } else if (response.status === 'fail') {
                                alert(response.msg);
                            } else {
                                alert(response.msg);
                            }
                        }
                    });
                } else {
                    $.ajax({
                        url: '/zf_user/company-review-qst-and-ans/registration-reply',
                        method: 'post',
                        dataType: 'json',
                        data: {
                            'contents' : contents,
                            'qust_idx' : qustIdx,
                            'uper_anwr_idx' : uperAnwrIdx,
                            'limit' : 1
                        },
                        success: function (response) {
                            if (response.status === 'success') {
                                $('#reply_contents_' + uperAnwrIdx).val('');
                                $('#list_reply_' + uperAnwrIdx).html('');
                                $('#list_reply_' + uperAnwrIdx).html(response.html);
                                if (response.privacy_text_msg) {
                                    alert(response.privacy_text_msg.replace('\<br\>', '\n'));
                                }
                            } else if (response.status === 'fail') {
                                alert(response.msg);
                            } else {
                                alert(response.msg);
                            }
                        }
                    });
                }
            });

            this.qnaAnswerReplyBox.on('click', '.answer_reply_more', function () {
                var uperAnwrIdx = $(this).data('uper_anwr_idx');

                if ($('#list_reply_' + uperAnwrIdx).parents('.list_reply').hasClass('open')) {
                    $('#list_reply_' + uperAnwrIdx).parents('.list_reply').removeClass('open');
                    $('#answer_reply_more_' + uperAnwrIdx).html('<span class="more">대댓글 더보기</span>');
                    return;
                }

                if (uperAnwrIdx == '') {
                    alert('오류가 발생하였습니다.');
                    return;
                }

                $.ajax({
                    url: '/zf_user/company-review-qst-and-ans/get-answer-reply-list-ajax',
                    method: 'post',
                    dataType: 'json',
                    data: {
                        'uper_anwr_idx' : uperAnwrIdx,
                    },
                    success: function (response) {
                        if (response.status === 'success') {
                            $('#list_reply_' + uperAnwrIdx).html('');
                            $('#list_reply_' + uperAnwrIdx).html(response.html);
                            $('#list_reply_' + uperAnwrIdx).parents('.list_reply').addClass('open');
                            $('#answer_reply_more_' + uperAnwrIdx).html('<span class="less">대댓글 접기</span>');
                        }
                    }
                });
            });

            this.qnaAnswerReplyBox.on('click', '.answer_more', function () {
                var qustIdx = $(this).data('qust_idx'),
                  replySort = $(this).data('reply_sort'),
                  page = $('#answer_more_page').val();

                if (qustIdx == '') {
                    alert('오류가 발생하였습니다.');
                    return;
                }

                $.ajax({
                    url: '/zf_user/company-review-qst-and-ans/get-answer-list-more-ajax',
                    method: 'post',
                    dataType: 'json',
                    data: {
                        'qust_idx' : qustIdx,
                        'page' : page,
                        'reply_sort': replySort,
                    },
                    success: function (response) {
                        if (response.status === 'success') {
                            $('.add_list_answer_contents').append(response.html);
                            if (response.list_count > page * 5) {
                                $('#answer_more_page').val(response.next_page);
                            } else {
                                $('.answer_more').hide();
                            }
                        }
                    }
                });
            });


            this.qnaAnswerReplyBox.on('click', '.comment_write_button', function () {
                var $parent        = $(this).closest('li');
                var replyInputWrap = $parent.find(".comment_reply_input");
                var commentInfo    = $(this).closest('.comment_view').find('.comment_info .nickname');

                if ($(this).hasClass('comment_re_reply')) { // 답글달기
                    var nickName = commentInfo.text().trim();
                    if (nickName !== '') {
                        replyInputWrap.find('button').data('call_mem_idx', commentInfo.data('reg_mem_idx'));
                        replyInputWrap.find('.comment_write').attr("data-reply-to", "@" + nickName);
                    }
                } else { // 대댓글달기, 대댓글n
                    replyInputWrap.find('button').data('call_mem_idx', '');
                    replyInputWrap.find('.comment_write').attr("data-reply-to", "");

                    if (!$parent.find('.list_reply').hasClass('open')) {
                        $parent.find('.answer_reply_more').trigger('click');
                    }
                }

                replyInputWrap.show();
                replyInputWrap.find('input').focus();
            });


            $('#qna_answer_box').on('click', '.btn_thanks', function () {
                var regMemIdx = $(this).data('reg_mem_idx'),
                    anwrIdx = $(this).data('anwr_idx');
                $('#thanks_card_anwr_idx').val(anwrIdx);
                $('#thanks_card_dest_mem_idx').val(regMemIdx);
                $('#thanks_card_anwr_nickname').val($(this).data('anwr_nickname'));
                $('#thanks_card_reg_nickname').val($(this).data('reg_nickname'));
                $('#messageType1').trigger('click');
                $('#msg5').trigger('click');
                $('.list_message').css('display','block');
                $('.cont_bgcolor, .card_write').css('display','none');
                $('#thanks_card_contents').val('');
                $('#thanks_card_contents').prop('disabled', true);
                $('#dimmed').show();
                $('.layer_thanks_send').show();
            });

            $('input:radio[name="messageType"]').on('click', function () {
                var checkType = $('input:radio[name="messageType"]:checked').val();
                if (checkType == 'messageType1') {
                    $('#thanks_card_contents').prop('disabled', true);
                    $('.list_message').css('display','block');
                    $('.cont_bgcolor, .card_write').css('display','none');
                } else {
                    $('#thanks_card_contents').prop('disabled', false);
                    $('.list_message').css('display','none');
                    $('.cont_bgcolor, .card_write').css('display','block');
                }
            });

            $('.qna_thanks_card_send').on('click', function () {
                var submit = [];
                var f = document.qna_thanks_card_form;
                var checkType = $('input:radio[name="messageType"]:checked').val();
                var special = /[<>]/g;
                var noSpecialMsg = '\'<>\' 문자는 입력하실수 없습니다.';

                if (checkType == 'messageType2') {
                    if ($('#thanks_card_contents').val() == '') {
                        alert('내용을 입력하세요!');
                        return;
                    }

                    if ($('#thanks_card_contents').val().match(special)) {
                        alert(noSpecialMsg);
                        return;
                    }
                }

                if(!confirm('감동 카드를 보내시겠습니까?')) return;

                $('.txt_alert').hide();
                $('#thanks_card_contents').removeClass('error');

                var url = '/zf_user/company-review-qst-and-ans/registration-thanks-card-ajax';
                $(f).ajaxForm({
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    success: function (result) {
                        if (result.status === 'success') {
                            alert('감동 카드가 발송되었습니다♥');
                            var anwrIdx = $('#thanks_card_anwr_idx').val();
                            $('#send_thanks_card_' + anwrIdx).hide();
                            $('#send_compelte_thanks_card_' + anwrIdx).show();
                            $('#messageType1').trigger('click');
                            $('#msg5').trigger('click');
                            $('.list_message').css('display','block');
                            $('.cont_bgcolor, .card_write').css('display','none');
                            $('#thanks_card_contents').val('');
                            $('#thanks_card_contents').prop('disabled', true);
                            $('#dimmed').hide();
                            $('.modalWrap').hide();
                            $('.toolTip').hide();
                        } else if (result.status === 'fail') {
                            if (result.code == 99) {
                                $('.txt_alert').show();
                                $('#thanks_card_contents').addClass('error');
                            } else {
                                alert(result.msg);
                            }
                        }
                    },
                    error: function (error) {
                        alert('오류가 발생하였습니다.');
                    }
                }).submit();

            });

            $('.lpop_report_layer_close').on('click', function () {
                $('#dimmed').hide();
                $('.lpop_report').hide();
            });

            $('.report_submit').click(function () {

                var submit = [];
                var f = document.qna_report_form;

                if ($('input:radio[name="report"]:checked').val() === undefined) {
                    alert('선택된 신고 항목이 없습니다.');
                    return;
                }

                if(!confirm('정말 신고 하시겠습니까?')) return;

                var postProc = DETAILPAGE.Detail.reportPostProcess || 'reload';

                var url = '/zf_user/company-review-qst-and-ans/company-qna-reg-report';
                $(f).ajaxForm({
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    success: function (result) {
                        if (result.status === 'success') {
                            alert('신고가 접수 되었습니다.');
                            $('#dimmed').hide();
                            $('.lpop_report').hide();
                            if (postProc === 'redirect_home') {
                                location.href = '/zf_user/company-review-qst-and-ans';
                            } else {
                                window.location.reload();
                            }
                        } else if (result.status === 'fail') {
                            alert(result.msg);
                        }
                    },
                    error: function (error) {
                        alert('오류가 발생하였습니다.');
                    }
                }).submit();

            });

            $('.delete_tool_tip_close').on('click', function () {
                $('.toolTip').removeClass('on');
                $(this).parent().hide();
            });

            $('.layer_thanks_send').on('click', '.btn_close', function () {
                var msgType = $('input:radio[name="messageType"]:checked').val();
                var thksType = msgType == 'messageType1' ? $('input:radio[name="msg"]:checked').val() : $('input:radio[name="color"]:checked').val();
                var contents = $('#thanks_card_contents').val();
                var msgContents = '';
                if (msgType == 'messageType1') {
                    contents = $('label[class="msg ' + thksType + '"]').find('.blind').text();
                    msgContents = '<div class="msg ' + thksType + '"><p class="blind">' + contents + '</p></div>';
                } else {
                    msgContents = '<div class="bgcolor ' + thksType + '"><p class="txt">' + contents + '</p></div>';
                }

                $('.layer_thanks_result').find('.anwr_nickname').text($('#thanks_card_anwr_nickname').val());
                $('.layer_thanks_result').find('.reg_nickname').text($('#thanks_card_reg_nickname').val());
                $('.layer_thanks_result').find('.card_contents').html(msgContents)
                $('.layer_thanks_result').show();
                $('.layer_thanks_send').hide();
            });

            $('.layer_thanks_result').on('click', '.btn_close', function () {
                $('.layer_thanks_result').hide();
                $('.layer_thanks_send').show();
            });

            // 댓글 삭제 ( 더보기 시 이벤트를 걸어줘야 한다 )
            $(document).on('click', '.btn_comment_my', function(e) {
                $(this).next().toggleClass('on');
            }).on('blur', '.btn_comment_my', function() {
                $('.comment_modify_wrap').removeClass('on');
            });

            // 댓글 이미지 첨부 & 미리보기
            $('#reply_file').on('change', function(e) {
                DETAILPAGE.Detail.gaEvent('qst_detail', 'image_a');
                var files = e.target.files || e.dataTransfer.files;
                var allowExtensionTypes = /jpg|jpeg|png|gif/i;
                var $maxFileSize = 2097152;
                if (files[0].type.search(allowExtensionTypes) < 0
                  || files[0].name.lastIndexOf('.jfif') > -1 // type은 image/jpeg로 확인되어 name에서 체크
                  || files[0].size >= $maxFileSize) {
                    alert('파일첨부에 실패하였습니다. jpg, gif, png 파일로 2MB 이하 파일만 첨부할 수 있습니다.');
                    $(this).val(''); // 초기화
                    return;
                }
                var src = URL.createObjectURL(files[0]);
                $('#reply_preview').attr('src', src);
                $('.add_img_list').show();
            });

            // 댓글 이미지 첨부 & 미리보기 삭제
            $('.img_delete').on('click', function() {
                $('.add_img_list').hide();
                $('#reply_preview').attr('src', '');
                $('#reply_file').val('');
            });

            // 댓글 정렬
            $('#replySort').on('change', function(e) {
                DETAILPAGE.Detail.gaEvent('qst_detail', 'filter_a');
                var params = {};
                window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) {
                    params[key] = value;
                });

                if (params.replySort) {
                    delete params.replySort;
                }

                var value = $(this).val();
                var isLike = value === 'like';
                if (isLike) {
                    params.replySort = value;
                }
                DETAILPAGE.Detail.gaEvent('qst_detail', isLike ? 'filter_like' : 'filter_new');

                var queryString = Object.keys(params).map(function(key) {
                    return key + '=' + params[key];
                }).join('&');

                window.location.href = window.location.pathname + '?' + queryString;
            });

            // 댓글/대댓글 더보기 (신고/삭제)
            $(document)
              .on('click', '.btn_comment_etc', function() {
                  $(this).next('.comment_modify_wrap').toggleClass('on');
              }).on('blur', '.btn_comment_etc', function() {
                $('.comment_modify_wrap').removeClass('on');
            });
        },

        checkLength: function (ju, max, type) {
            var className = (type == 'thanks_card') ? '.card_write' : '.info_write';
            var inputContents =  (type == 'thanks_card') ? '#thanks_card_contents' : '#contents';
            var alertTitle = (type == 'thanks_card') ? '감동 카드 내용은 ' : '댓글 내용은 ';
            var $number = $(className).find('.bytes'),
                cntStr = '<em>' + ju.length + '</em>/' + max + '자';
            $number.html(cntStr);

            if (ju.length > max) {
                alert(alertTitle + max + '자 까지만 입력 가능합니다! 혹시 조금만 줄여주시겠어요..?ㅎㅎ');
                ju = ju.substring(0, max);
                $(inputContents).val(ju);
                $number.html('<em>' + max + '</em>/' + max + '자');
                return false;
            }
        },

        likeBtnClick: function (elt, idx, likeType, sympType) {
            if ($(elt).hasClass('on')) {
                var value = 'n';
            } else {
                var value = 'y';
            }
            var symp = sympType ? sympType : 'like';
            $.ajax({
                url: '/zf_user/company-review-qst-and-ans/like-ajax',
                method: 'post',
                dataType: 'json',
                data: {
                    'value' : value,
                    'type' : likeType,
                    'symp': symp,
                    'idx' : idx,
                },
                success: function (response) {
                    if (response.result !== 'success') {
                        alert(response.message);
                        window.login();
                        return;
                    }
                    var sympArr = ['like', 'fun', 'help', 'cheer'];
                    var isQust = likeType === 'qust';

                    // class on/off
                    if (response.value === 'y') {
                        $(elt).addClass('on');
                        if (isQust) {
                            sympArr
                              .filter(function(s) {
                                  return s !== symp;
                              })
                              .forEach(function(s) {
                                  $('.post_emoticon .' + s).removeClass('on');
                              });
                        }
                    } else {
                        $(elt).removeClass('on');
                    }

                    // count text
                    var like_cnt = response.like_cnt;
                    if (isQust) {
                        var totalCount = 0;
                        var isExistSympArr = Object.keys(like_cnt);
                        sympArr.forEach(function(s) {
                            var target = $('.post_emoticon .' + s + ' strong');
                            if (isExistSympArr.indexOf(s) > -1) {
                                totalCount += parseInt(like_cnt[s], 10);
                                target.text(like_cnt[s]);
                            } else {
                                target.text(0);
                            }
                        });
                        $('.likeTotalCount').text(totalCount);
                    } else {
                        $(elt).text((Object.keys(like_cnt).indexOf(symp) > -1) ? like_cnt[symp] : '공감하기');
                    }

                }
            });
        },

        myQnaContentsDelete: function (idx, type) {
            var typeStr = (type == 'anwr') ? '댓글' : '게시글';

            if (type === 'qust') {
                if (!window.confirm('입력하신 글을 정말 삭제하시겠어요? 삭제하신 글은 복구하실 수 없습니다..ㅠㅠ 글 수정을 원할 경우, 수정 버튼 클릭 후 수정해주세요.')) {
                    return;
                }
            } else {
                if (!window.confirm('입력하신 ' + typeStr + '을 정말 삭제하시겠어요? 삭제하신 ' + typeStr + '은 복구하실 수 없습니다..ㅠㅠ 다시 등록하고 싶으시다면, 삭제 후 다시 작성해주세요!')) {
                    return;
                }
            }

            $.ajax({
                url: '/zf_user/company-review-qst-and-ans/my-qna-contents-delete',
                method: 'post',
                dataType: 'json',
                data: {
                    'idx': idx,
                    'type': type,
                },
                success: function (response) {
                    if (response.status === 'success') {
                        alert(typeStr + '이 삭제 되었습니다.');
                        if (type == 'qust') {
                            location.href = '/zf_user/company-review-qst-and-ans';
                        } else {
                            location.reload();
                        }
                    } else if (response.status === 'login') {
                        Saramin.showQuickLogin();
                    } else {
                        alert(response.msg ? response.msg : '오류가 발생하였습니다.');
                    }
                }
            });
        },

        reportLayerShow: function (idx, type, postProc) {
            $j('#report_idx').val(idx);
            $j('#report_type').val(type);

            this.reportPostProcess = postProc || '';

            if ($j(".lpop_report").css("display") == "none") {
                $('#dimmed').show();
                $j('.lpop_report').show();
                $('#report_contents').val('');
                $('input:radio[name="report"]').prop('checked', false);
            } else {
                $('#dimmed').hide();
                $j('.lpop_report').hide();
            }
        },

        blackList: function (idx, isLogin) {
            if (isLogin === '') {
                Saramin.showQuickLogin();
                return false;
            }

            if (!confirm("사용자를 차단하면 나의 게시물에 해당 사용자가 접근할 수 없습니다.(댓글 작성 불가)")) {
                return false;
            }

            $.ajax({
                url: '/zf_user/company-review-qst-and-ans/add-blacklist',
                type: 'post',
                data: {block_mem_idx: idx},
                dataType: 'JSON'
            }).done(function (res) {
                if (res.status === 'success' || res.status === 'fail') {
                    alert(res.msg);
                    location.reload();
                } else if (res.status === 'already' ){
                    alert(res.msg);
                } else {
                    alert('잠시후 다시 시도해 주세요.');
                    location.href = '/zf_user/company-review-qst-and-ans';
                }
            });
        },

        getSimilarList: function (el) {
            var pageNum = parseInt($('.similar_list_btn_more').data('page')) + 1,
                hashtag = $('.similar_list_btn_more').data('hashtag'),
                $moreBtn = $('.similar_list_btn_more'),
                $list = $('.list_similar');

            $.ajax({
                type: "post",
                url: "/zf_user/company-review-qst-and-ans/get-similar-list-ajax",
                data: {page: pageNum, hashtag: hashtag},
                success: function (result) {
                    if (!!result.html) {
                        $list.append(result.html);
                        (!!result.more && result.more == 'n') ? $moreBtn.hide() : $moreBtn.show();
                        $moreBtn.data('page', result.pageNum);
                    }
                },
                error: function () {
                    alert('새로고침 후 다시 시도해주시기 바랍니다.');
                }
            });
        },

        increaseCount: function (tag) {
            var count = parseInt(tag.text(), 10) + 1;
            tag.html((isNaN(count) ? 1 : count));
        },

        checkEmoji: function (keyword) {
            var emojiRegExr = /(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/g;
            return emojiRegExr.test(keyword);
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

    DETAILPAGE.Detail = new Detail();

    document.addEventListener("DOMContentLoaded", function () {
        DETAILPAGE.Detail.init();
    }, false);

}(jQuery));