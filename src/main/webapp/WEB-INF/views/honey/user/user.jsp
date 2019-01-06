<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script id="jscode">
	var myGrid = new AXGrid();

	var fnObj = {
		pageStart : function() {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");

			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});

			jQuery("#userRole").bindSelect({
				isspace : true,
				isspaceTitle : "-- Select --",
				isspaceValue : "0",
				reserveKeys: {
					optionValue: "code",
					optionText: "name"
				},
				options:[{"code":"ADMIN", "name":"Admin"},{"code":"USER", "name":"User"}],
				onChange: function(){
					toast.push(Object.toJSON(this));
				}
			});
			jQuery("#userRole").setValueSelect(1);

			fnObj.grid.bind();
			fnObj.search.bind();

		},
		search : {
			target : new AXSearch(),
			bind : function() {
				window.search = fnObj.search.target;
				search.setConfig({
					targetID : "regForm",
					onsubmit : function() {
						fnObj.grid.setList();
					}
				});
				search.submit();
			},
			reset : function() {
				this.target.reset();
				this.bind();
				search.submit();
			}
		},
		grid : {
			target : new AXGrid(),
			bind : function() {
				window.myGrid = fnObj.grid.target;

				var getColGroup = function() {
					return [
							{key : "deleteStatus", label : "Delete", width : "80", align : "center" },
							{key : "userFullname", label : "Full name", width : "*",
								tooltip : function() {
									return this.item.no + "." + this.item.title
											+ "/" + this.key + "/" + this.value;
								},
								colHeadTool : false,
								sort : false
							}, 
							{key : "userUsername", label : "Username", width : "*" }, 
							{key : "userPhone", label : "Phone", width : "*" }, 
							{key : "userEmail", label : "Email", width : "*" }, 
							{key : "addressName", label : "Address", width : "*" }, 
							{key : "roleName", label : "Role", width : "*" }, 
							{key : "statusName", label : "Status", width : "*" }, 
							{key : "creationDate", label : "Creation date", width : "*" }, 
							{key : "createdByName", label : "Created by", width : "*" }, 
							{key : "modifiedDate", label : "Modified date", width : "*" }, 
							{key : "modifiedByName", label : "modified by", width : "*" } 
							];
				};

				myGrid.setConfig({
					targetID : "AXGridTarget",
					sort : true,
					colHeadTool : true,
					fitToWidth : false,
					colGroup : getColGroup(),
					height : 400,
					colHeadAlign : "center",
					body : {
						onclick : function() {
							toast.push(Object.toJSON({
								"event" : "click",
								"index" : this.index,
								"r" : this.r,
								"c" : this.c,
								"item" : this.item
							}));
							// this.list, this.page
							fnObj.fillout(this.item);
						},
						ondblclick : function() {
							toast.push(Object.toJSON({
								"event" : "dblclick",
								"index" : this.index,
								"r" : this.r,
								"c" : this.c,
								"item" : this.item
							}));
							// this.list, this.page
							fnObj.fillout(this.item);
						},
						addClass : function() {
							return (this.index % 2 == 0 ? "gray" : "white"); // red, green, blue, yellow, white, gray
						}
					},
					page : {
						paging : true,
						onchange : function(pageNo) {
							//dialog.push(Object.toJSON(this));
							fnObj.grid.setList();
							trace(this, pageNo);
						}
					}
				});
			},
			setList : function() {
				var createdBy = $('#createdBy').val();
				var modifiedBy = $('#modifiedBy').val();
				var roleId = $('#roleId').val();
				var statusId = $('#statusId').val();
				if (createdBy == '' || createdBy == null) {
					$('#createdBy').val('0');
				}

				if (modifiedBy == '' || modifiedBy == null) {
					$('#modifiedBy').val('0');
				}

				$.ajax({
					url : "selectUserListPaging.json",
					type : 'POST',
					cache : false,
					data : search.getParam() + '&pageNo=' + myGrid.page.pageNo + '&pageSize=' + myGrid.page.pageSize,
					dataType : 'json',
					success : function(string) {
						var gridData = {
							list : string.list,
							page : {
								pageNo : string.paging.pageNo,
								pageSize : string.paging.pageSize,
								pageCount : string.paging.pageCount,
								listCount : string.paging.listCount
							}
						};
						myGrid.setData(gridData);
					},
					error : function() {
						toast.push('Một lỗi xảy ra khi đọc dữ liệu vào bảng!');
					}
				});
			},
			deleteItem : function(index) {
				$.Event(event).stopPropagation();
				var item = myGrid.list[index];
				toast.push('deleteItem: ' + $.param(item).dec());
			},
			getExcel : function(type) {
				var obj = myGrid.getExcelFormat(type);
				trace(obj);
				$("#printout").html(Object.toJSON(obj));
			},
			getSelectedItem : function() {
				trace(this.target.getSelectedItem());
				toast.push('콘솔창에 데이터를 출력하였습니다.');
			}
		},
		save : function() {
			$.ajax({
				url : "http://localhost:8080/honey/inser.html",
				type : 'GET',
				data : search.getParam(),
				success : function(string) {
					toast.push(string.ok + 'thao tác đã được thực hiện thành công!');
				},
				error : function() {
					toast.push('Một lỗi xảy ra khi tạo mới người sử dụng!');
				}
			});
		},
		reset : function() {
			$('#regForm').trigger("reset");
			$("#userId").val("0");
			$("#addressId").val("0");
			jQuery('#roleId').bindSelectSetValue(0);
			jQuery('#statusId').bindSelectSetValue(0);
		},
		fillout : function(item) {
			$('#addressName').val(item.addressName);
			$("input[name='deleteStatus'][value='" + item.deleteStatus + "']")
					.prop('checked', true);
			jQuery('#roleId').bindSelectSetValue(item.roleId);
			jQuery('#statusId').bindSelectSetValue(item.statusId);
			$('#userEmail').val(item.userEmail);
			$('#userFullname').val(item.userFullname);
			$('#userId').val(item.userId);
			$('#addressId').val(item.addressId);
			$('#userPassword').val(item.userPassword);
			$('#userPhone').val(item.userPhone);
			$('#userUsername').val(item.userUsername);
		}
	};
	jQuery(document.body).ready(function() {
		fnObj.pageStart();
	});
</script>

</head>
<body>
	<form name="regForm" id="regForm" method="POST" style="width: 800px;" align="center">
		<table class="AXFormTable">
			<colgroup>
				<col width="50" />
				<col width="100" />
				<col width="50" />
				<col width="100" />
			</colgroup>
			<tbody>
				<tr>
					<td><label path="userFullname">Họ và tên<label></td>
					<td><input type="text" path="userFullname" name="userFullname" id="userFullname" /></td>

					<td><label path="userId">ID đăng nhập<label></td>
					<td><input type="text" path="userId" name="userId" id="userId" /></td>
				</tr>

				<tr>
					<td><label path="userPassword">Mật khẩu<label></td>
					<td><input type="password" path="userPassword" name="userPassword" id="userPassword" /></td>
					
					<td><label path="userPhone">Điện thoại<label></td>
					<td><input type="text" path="userPhone" name="userPhone" id="userPhone" /></td>
				</tr>
					
				<tr>
					<td><label path="userEmail">Email<label></td>
					<td><input type="text" path="userEmail" name="userEmail" id="userEmail" /></td>
					
					<td><label path="userAddress">Địa chỉ<label></td>
					<td><input type="text" path="userAddress" name="userAddress" id="userAddress" /></td>
				</tr>

				<tr>
					<td><label path="userRole">Quyền hạn<label></td>
					<td><select name="userRole" class="AXSelect W100" id="userRole"></select></td>
					
					<td><label path="deleteStatus">Trạng thái xóa<label></td>
					<td>
						<label><input type="radio" id="deleteStatus" name="deleteStatus" value="N" class="someClass" checked />No</label>
						<label><input type="radio" id="deleteStatus" name="deleteStatus" value="Y" class="someClass" />Yes</label>
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td colspan=3>
						<input type="button" value="Save" class="AXButton Red" onclick="fnObj.save();" /> 
						<input type="button" value="New" class="AXButton Red" onclick="fnObj.reset();" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<div class="AXdemoPageContent">
		<div id="grid0">
			<div style="padding-bottom: 10px; float: right;">
				<button type="button" class="AXButton Green" onclick="fnObj.grid.getExcel('html');"> Tìm kiếm </button>
			</div>
			<div id="AXGridTarget" style="height: 300px; clear: both;"></div>
		</div>
		<div id="printout" style="clear: both;"></div>
	</div>

</body>
</html>