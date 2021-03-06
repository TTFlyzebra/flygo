-include ../makefile.init

RM := rm -rf
CC = arm-linux-androideabi-gcc
-include sources.mk
-include src/subdir.mk
-include src/json/subdir.mk
-include src/log/subdir.mk
-include src/tool/subdir.mk
-include src/mycurl/subdir.mk
-include src/mylua/subdir.mk
USER_OBJS :=
LIBS := -lcurl -llua -ldl -lm

all: FlyGo

FlyGo: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross GCC Linker'
	$(CC) -o "build/bin/flygo-android" $(OBJS) $(USER_OBJS) ./src/lib/arm/libcurl.a ./src/lib/arm/liblua.a  -ldl -lm
	@echo 'Finished building target: $@'
	@echo ' '

clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) FlyGo
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.init
