FILES :=                              \
	data_models					  \
	RFE_ddl_files				      \
	RFE.dml						  \
	RFE_app.sql			  \
	mobile_app.sql         \
	README.md						  \
	CS347_Project.pdf 				  \

	
check:
	@not_found=0;                                 \
    for i in $(FILES);                            \
    do                                            \
        if [ -e $$i ];                            \
        then                                      \
            echo "$$i found";                     \
        else                                      \
            echo "$$i NOT FOUND";                 \
            not_found=`expr "$$not_found" + "1"`; \
        fi                                        \
    done;                                         \
    if [ $$not_found -ne 0 ];                     \
    then                                          \
        echo "$$not_found failures";              \
        exit 1;                                   \
    fi;                                           \
    echo "success";

